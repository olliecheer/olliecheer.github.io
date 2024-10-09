

```c++
// Formula 1
// (a*b) % p = (a % p * b % p) % p

// Formula 2
//   a^n
// = a(n - 1) * a; if n % 2 == 1
// = a^(n/2) * a^(n/2); if n % 2 == 0 and n != 0
// = 1; if n == 0

//   a^b % c
// = (a^2)^(b/2) % c if b % 2 == 0
// = (a^2)^(b/2) * a % c if b % 2 == 1


// T(n) = O(Logn)
int fast_pow(int a, int b) {
  int res = 1;

  while (b) {
    if (b % 2)
      res = res * a;

    a = a * a;
    b /= 2;
  }

  return res;
}

// T(n) = O(logn)
int fast_pow_mod(int a, int b, int c) {
  int res = 1;

  while (b) {
    if (b % 2)
      res = (res * a) % c;

    a = (a * a) % c;
    b /= 2;
  }

  return res;
}
```
