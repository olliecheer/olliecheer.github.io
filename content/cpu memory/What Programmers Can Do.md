

# Bypassing the Cache

## Motivation

When data is produced and not immediately consumed again, the fact that memory store operations read a full cache line first, and then modify the cached data is detrimental to performance.

This operation pushes data out of the caches which might be needed again in favor of data which will not be used soon. This is especially true for large data structures, which are filled and then used later. Before the last element of the matrix is filled the sheer size evicts the first elements, making caching of the writes ineffective.

## Method

Processors provide support for ***non-temporal*** write operations, which means for the data that will not be reused soon, there is no reason to cache it. These non-temporal write operations do not read a cache line and then modify it, instead, the new content is directly written to memory.

The processor will try to use write-combining to fill entire cache lines, If this succeeds no memory read operation is needed at all.

These instructions are used most efficiently if they process large amounts of data in one go. Data is loaded from memory, processed in one or more steps, and then written back to memory.



# Cache Access

The theme for all memory access is the same: **improve locality** (spatial and temporal) and **align the code and data**.

## Optimizing Level 1 Data Cache Access

### Sequential Memory Access


Let's concentrate on optimizations to access memory sequentially.

#### Example: matric multiplication

Given two matrices *A* and *B* with elements $a_{ij}$ and $b_{ij}$ with $0\le i,j<N$, the product is:
$(AB)_{ij} = \sum_{k=0}^{N-1} a_{ik}b_{kj} = a_{i0}b_{0j} + a_{i1}b_{1j} + ... + a_{i(N-1)}b_{(N-1)j}$ 

The straight forward C implementation of this can look like this:

```c
for(int i = 0; i < N; i++)
	for(int j = 0; j < N; j++)
		for(int k = 0; k < N; k++)
			res[i][j] += mul1[i][k] * mul2[k][j];
```

![[cpu memory/pictures/Pasted image 20240913000213.png]]

This means that *mul1* is handled like the left matrix, while *mul2* is handled like the right matrix. This cannot be good.

##### Transpose
One possible remedy is to rearrange ("transpose") the matrix *mul2* before using it.

$(AB)_{ij} = \sum_{k=0}^{N-1} a_{ik}b_{jk}^T = a_{i0}b_{j0}^T + a_{i1}b_{j1}^T + ... + a_{i(N-1)}b_{j(N-1)}^T$ 

After this transposition, we now iterate over both matrices sequentially.

```c
double tmp[N][N];
for(int i = 0; i < N; i++)
	for(int j = 0; j < N; j++)
		tmp[i][j] = mul2[j][i];

for(int i = 0; i < N; i++)
	for(int j = 0; j < N; j++)
		for(int k = 0; k < N; k++)
			res[i][j] += mul1[i][k] * mul2[j][k];
```

Here is a possible benchmark result:
![[cpu memory/pictures/Pasted image 20240913000905.png]]
Through simple transformation of the matrix, we can achieve a 76.6% speed up. The **1000** **non-sequential** accesses really hurt.

##### Sub-Matrix
However, we will not always have the luxury to be able to perform the copy: the matrix can be too large or the available memory too small.

Let's examine the actual problem in the execution of the original code.
The order in which the elements of *mul2* are accessed is: (0,0), (1,0), ..., (N-1,0), (0,1), (1,1),.... The elements (0,0) and (0,1) are in the same cache line, but, by the time the inner loop completes one round, this cache line has long been evicted.
For this example, each round of the inner loop requires, for each of the three matrices, 1000 cache lines(typically 64 bytes). This adds up to mush more than 32k of L1d available.

But what if we handle two iterations of the middle loop together while executing the inner loop? In this case, we use two double values from the cache line which is guaranteed to be in L1d. We cut the L1d miss rate in half.

That is certainly an improvement, but, depending on the cache line size, it still might not be as good as we get it.

Let's assume the cache line size is 64 bytes. With the `sizeof(double)` being 8 bytes, to fully utilize the cache line, we should unroll the middle loop 8 times. Continuing this thought, to effectively use the res matrix as well, to write 8 results at the same time, we should unroll the outer loop 8 times as well.

```c
#define SM (CLS / sizeof(double))

for(int i = 0; i < N; i += SM)
	for(int j = 0; j < N; j += SM)
		for(int k = 0; k < N; k += SM) {
			double* rres = &res[i][j];
			double* rmul1 = &mul1[i][k];
			for(int i2 = 0; i2 < SM; i2++, rres += N, rmul1 += N) {
				double* rmul2 = &mul2[k][j];
				for(int k2 = 0; k2 < SM; k2++, rmul2 += N)
					for(int j2 = 0; j2 < SM; j2++)
						rres[j2] += rmul1[k2] * rmul2[j2];
			}
		}
```

The only tricky part here is that the k2 and j2 loops are in a different order. This is done, since, in the actual computation, only one expression depends on k2 but two depend on j2.

![[cpu memory/pictures/Pasted image 20240913003838.png]]
By avoiding the copying, we gain another 6.1% of performance. Plus, we do not need any additional memory. The input matrices can be arbitrarily large as long as the result matrix fits into memory as well. This is a requirement for a general solution which we have now achieved.

##### Vectorized
Most modern processors include special support for vectorization. These special instructions allow processing of 2, 4, 8, or more values at the same time. These are often **SIMD** operations, augmented by others to get the date in the right form. 

The SSE2 instructions provided by Intel processors can handle two double values in one operation. The instruction reference manual lists the intrinsic functions which provide access to these SSE2 instructions. If these intrinsics are used, the program runs another 7.3% faster. The result is a program which in 10% of the time of the original code.

```c
#include <stdlib.h>
#include <stdio.h>
#include <emmintrin.h>
#define N 1000
double res[N][N] __attribute__((aligned 64));
double mul1[N][N] __attribute__((aligned 64));
double mul2[N][N] __attribute__((aligned 64));
#define SM (CLS / sizeof(double))

int main() {
	// Initialize mul1 and mul2
	
	int i, i2, j, j2, k, k2;
	double *rres;
	double *rmul1;
	double *rmul2;
	for(i = 0; i<N; i += SM)
		for(j = 0; j < N; j += SM)
			for(k = 0; k < N; k += SM)
				for(i2 = 0, rres = &res[i][j], rmul1 = &mul1[i][k];
					i2 < SM; i2++, rres += N, rmul1 += N) {
					_mm_prefetch (&rmul1[8], _MM_HINT_NTA);
					for(k2 = 0, rmul2 = &mul2[k][j];
						k2 < SM; k2++, rmul2 += N) {
						__m128d m1d = _mm_load_sd(&rmul1[k2]);
						m1d = _mm_unpacklo_pd(m1d, m1d);
						for(j2 = 0; j2 < SM; j2 += 2) {
							__m128d m2 = _mm_load_pd(&rmul2[j2]);
							__m128d r2 = _mm_load_pd(&rres[j2]);
							_mm_store_pd(&rres[j2],
								_mm_add_pd(_mm_mul_pd(m2, m1d), r2));
						}
					}
				}

	// use res matrix

	return 0;
}
```

It should be noted that, in the last version of the code, we still have some cache problems with mul2: prefetching still will not work. But this cannot be solved without transposing the matrix. Maybe the cache prefetching units will get smarter to recognize the patterns, then no additional change would be needed.


