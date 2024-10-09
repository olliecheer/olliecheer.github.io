```c++
// time complexity: O(n^2)
// space complexity: constant O(1)
void bubble_sort(vec<int> &nums) {
  int nr = nums.size();

  // We loop (nr-1) times.
  // Each time, the largest element in this loop  // will be placed at its final
  // index.  for (int i = 0; i < nr - 1; i++)
  for (int j = 0; j < nr - 1 - i; j++)
    if (nums[j] > nums[j + 1])
      std::swap(nums[j], nums[j + 1]);
}

// time complexity: O(n^2)
// space complexity: constant O(1)
void selection_sort(vec<int> &nums) {
  int nr = nums.size();

  if (nr <= 1)
    return;

  // Each time, we select the minimal element,
  // and place it at the very first index in this loop.  for (int i = 0; i < nr
  // - 1; i++) {
  int minimal_idx = i;
  for (int j = i + 1; j < nr; j++)
    if (nums[j] < nums[minimal_idx])
      minimal_idx = j;

  std::swap(nums[i], minimal_idx);
}
}

// time complexity: O(n^2)
// space complexity: constant O(1)
void insertion_sort(vec<int> &nums) {
  int nr = nums.size();

  //
  for (int i = 0; i < nr; i++) {
    int tmp = nums[i];
    int j = i;
    for (; j > 0 && nums[j - 1] > tmp; j--) {
      nums[j] = nums[j - 1];
    }

    nums[j] = tmp;
  }
}

// time complexity: O(n^2)
// space complexity: constant O(1)
void shell_sort(vec<int> &nums) {
  int nr = nums.size();
  for (int gap = nr / 2; gap > 0; gap /= 2) {
    for (int i = gap; i < nr; i++) {
      int tmp = nums[i];
      int j = i;
      for (; nums[j - gap] > tmp; j -= gap) {
        nums[j] = nums[j - gap];
      }
      nums[j] = tmp;
    }
  }
}

// time complexity: average O(nlogn), worst case O(n^2)
namespace quick_sort {
int randint(int min, int max) { return min + rand() % (max - min + 1); }

void do_quick_sort(vec<int> &nums, int left, int right) {
  if (left >= right)
    return;

  std::swap(nums[left], nums[randint(left, right)]);

  int pivot = nums[left];
  int i = left, j = right;

  while (i < j) {
    for (; i < j && nums[j] >= pivot; j--)
      ;
    for (; i < j && nums[i] <= pivot; i++)
      ;
    if (i != j)
      std::swap(nums[i], nums[j]);
  }

  std::swap(nums[left], nums[i]);
  do_quick_sort(nums, left, i - 1);
  do_quick_sort(nums, i + 1, right);
}

void quick_sort(vec<int> &nums) { do_quick_sort(nums, 0, nums.size() - 1); }
} // namespace quick_sort

namespace merge_sort_node_list {
struct Node {
  int val;
  struct Node *next;
};

struct Node *find_mid(struct Node *head) {
  struct Node *slow = head, *fast = head;
  while (fast->next != nullptr && fast->next->next != nullptr) {
    slow = slow->next;
    fast = fast->next->next;
  }
  return slow;
}

struct Node *merge(struct Node *head1, struct Node *head2) {
  struct Node dummy;
  auto cur = &dummy;
  while (head1 && head2) {
    if (head1->val < head2->val) {
      cur->next = head1;
      head1 = head1->next;
    } else {
      cur->next = head2;
      head2 = head2->next;
    }
    cur = cur->next;
  }

  if (head1) {
    cur->next = head1;
  } else {
    cur->next = head2;
  }

  return dummy.next;
}

struct Node *sort_list(struct Node *head) {
  if (!head || !head->next)
    return head;

  auto mid = find_mid(head);
  auto right = sort_list(mid->next);
  mid->next = nullptr;
  auto left = sort_list(head);
  return merge(left, right);
}
} // namespace merge_sort_node_list

namespace merge_sort_array {

vec<int> merge(vec<int> &left, vec<int> &right) {
  vec<int> res(left.size() + right.size());
  int i = 0, j = 0, k = 0;
  while (i < left.size() && j < right.size()) {
    if (left[i] <= right[j]) {
      res[k] = left[i];
      i++;
    } else {
      res[k] = right[j];
      j++;
    }
  }

  while (i < left.size()) {
    res[k] = left[i];
    k++;
    i++;
  }

  while (j < right.size()) {
    res[k] = right[j];
    k++;
    j++;
  }

  return res;
}

vec<int> divide(vec<int> &nums, int left, int right) {
  if (left >= right)
    return {nums[left]};

  int mid = left + (right - left) / 2;
  auto left_res = divide(nums, left, mid);
  auto right_res = divide(nums, mid + 1, right);
  return merge(left_res, right_res);
}

vec<int> mergeSort(vec<int> &nums) { return divide(nums, 0, nums.size() - 1); }
} // namespace merge_sort_array

namespace heap_sort {
void heapify(vec<int> &nums, int const nr, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < nr && nums[left] > nums[largest])
    largest = left;

  if (right < nr && nums[right] > nums[largest])
    largest = right;

  if (largest != i) {
    std::swap(nums[i], nums[largest]);
    heapify(nums, nr, largest);
  }
}

void heap_sort(vec<int> &nums) {
  int nr = nums.size();
  for (int i = nr / 2; i >= 0; i--)
    heapify(nums, nr, i);
}
} // namespace heap_sort
```