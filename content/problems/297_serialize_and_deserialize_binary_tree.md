---
tags:
  - binary_tree
---
![[problems/pictures/Pasted image 20240908230048.png]]
![[problems/pictures/Pasted image 20240908230058.png]]


```c++
struct TreeNode {  
  int val;  
  TreeNode *left;  
  TreeNode *right;  
};  
  
class Codec {  
public:  
  static std::string serialize(TreeNode *root) {  
    if (!root) {  
      return "None,";  
    }  
  
    std::string res;  
    res += std::to_string(root->val) + ",";  
    res += serialize(root->left);  
    res += serialize(root->right);  
    return res;  
  }  
  
  TreeNode *deserialize(std::string &data) {  
    vec<std::string> words;  
    std::string tmp;  
  
    for (char c : data) {  
      if (c == ',') {  
        words.push_back(std::move(tmp));  
        tmp.clear();  
      } else {  
        tmp.push_back(c);  
      }  
    }  
  
    if (!tmp.empty()) {  
      words.push_back(std::move(tmp));  
    }  
  
    return do_deserialize(words);  
  }  
  
private:  
  TreeNode *do_deserialize(vec<std::string> &words) {  
    if (words.front() == "None") {  
      words.erase(words.begin());  
      return nullptr;  
    }  
  
    auto root = new TreeNode{std::stoi(words.front())};  
    words.erase(words.begin());  
  
    root->left = do_deserialize(words);  
    root->right = do_deserialize(words);  
    return root;  
  }  
};
```