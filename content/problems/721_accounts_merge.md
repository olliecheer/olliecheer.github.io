---
tags:
  - union_find
---
![[pictures/Pasted image 20241011100554.png]]
![[pictures/Pasted image 20241011100605.png]]
![[pictures/Pasted image 20241011100613.png]]


```c++
template <typename T> using vec = std::vector<T>;

class Solution {
  class DSU {
    std::unordered_map<std::string, std::string> parent;

  public:
    std::string find(std::string const &x) {
      if (parent.count(x) == 0)
        parent[x] = x;

      if (parent[x] != x)
        parent[x] = find(parent[x]);

      return parent[x];
    }

    void union_(std::string x, std::string y) { parent[find(x)] = find(y); }
  };

public:
  vec<vec<std::string>> accountsMerge(vec<vec<std::string>> &accounts) {
    DSU dsu;
    std::unordered_map<std::string, std::string> email2name;

    for (auto &it : accounts) {
      auto name = it[0];
      auto primary_email = it[1];

      for (int i = 1; i < it.size(); i++) {
        auto &email = it[i];
        email2name[email] = name;
        dsu.union_(primary_email, email);
      }
    }

    std::unordered_map<std::string, vec<std::string>>
        merged_account; // <primary_email, emails>
    for (auto &&it : email2name) {
      auto &&email = it.first;
      auto primary_email = dsu.find(email);
      merged_account[primary_email].push_back(email);
    }

    vec<vec<std::string>> res;
    for (auto &&it : merged_account) {
      auto emails = it.second;
      std::sort(emails.begin(), emails.end());
      auto name = email2name[emails[0]];
      emails.insert(emails.begin(), name);
      res.push_back(std::move(emails));
    }

    return res;
  }
};
```
