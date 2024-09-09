---
tags:
  - union_find
---
![[problems/pictures/Pasted image 20240909232827.png]]
![[problems/pictures/Pasted image 20240909232835.png]]

```c++
class Solution {  
  
  class DSU {  
    std::map<std::string, std::string> parent;  
  
  public:  
    std::string find(std::string x) {  
      if (parent.count(x) == 0)  
        parent[x] = x;  
  
      auto x_parent = parent[x];  
  
      if (x_parent != x)  
        x_parent = find(x_parent);  
  
      parent[x] = x_parent;  
  
      return parent[x];  
    }  
  
    void union_(std::string x, std::string y) {  
      parent.insert({find(x), find(y)});  
    }  
  };  
  
public:  
  vec<vec<std::string>> accountsMerge(vec<vec<std::string>> &accounts) {  
    DSU dsu;  
    std::unordered_map<std::string, std::string> email2name;  
  
    for (auto &&it : accounts) {  
      auto name = it[0];  
      auto primary_email = it[1];  
  
      for (int i = 1; i < it.size(); i++) {  
        auto &&email = it[i];  
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
      auto &&emails = it.second;  
      std::sort(emails.begin(), emails.end());  
      auto &&name = email2name[emails[0]];  
      vec<std::string> account;  
      account.push_back(name);  
      res.push_back(std::move(account));  
    }  
  
    return res;  
  }  
};
```