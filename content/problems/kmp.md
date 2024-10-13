


```c++
template <typename T> using vec = std::vector<T>;

int kmp_search(std::string const &s, std::string const &pattern) {
  if (pattern.empty())
    return -1;

  auto next = [&pattern]() {
    std::vector<int> res;
    res.push_back(0);
    int prefix_len = 0;
    for (int i = 1; i < pattern.size();) {
      if (pattern[prefix_len] == pattern[i]) {
        prefix_len++;
        res.push_back(prefix_len);
        i++;
      } else {
        if (prefix_len == 0) {
          res.push_back(0);
          i++;
        } else
          prefix_len = res[prefix_len - 1];
      }
    }

    return res;
  }();

  for (int i = 0, j = 0; i < s.size();) {
    if (s[i] == pattern[j]) {
      i++;
      j++;
    } else if (j > 0)
      j = next[j - 1];
    else
      i++;

    if (j == pattern.size())
      return i - j;
  }

  return -1;
}
```
