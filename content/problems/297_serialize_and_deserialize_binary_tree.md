---
tags:
  - binary_tree
---
![[pictures/Pasted image 20241014003043.png]]
![[pictures/Pasted image 20241014003058.png]]



```c++
struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
};

template <typename T> using vec = std::vector<T>;

class Codec {
  TreeNode *do_deserialize(std::list<std::string> &words) {
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

public:
  std::string serialize(TreeNode *root) {
    if (!root)
      return "None,";

    std::string res;
    res += std::to_string(root->val) + ",";
    res += serialize(root->left);
    res += serialize(root->right);
    return res;
  }

  TreeNode *deserialize(std::string &data) {
    std::list<std::string> words;
    std::string tmp;

    std::stringstream ss(data);
    while (std::getline(ss, tmp, ','))
      words.push_back(std::move(tmp));

    return do_deserialize(words);
  }
};
```