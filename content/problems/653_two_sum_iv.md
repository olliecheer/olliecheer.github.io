---
tags:
  - binary_tree
  - sum
---
![[problems/pictures/Pasted image 20240909230725.png]]
![[problems/pictures/Pasted image 20240909230738.png]]

```c++
struct TreeNode {  
    int val;  
    TreeNode *left, *right;  
};  
  
class BSTIterator {  
    std::stack<TreeNode *> stk;  
    bool forward;  
  
    void push_all_left(TreeNode *node) {  
        while (node) {  
            stk.push(node);  
            node = node->left;  
        }  
    }  
  
    void push_all_right(TreeNode *node) {  
        while (node) {  
            stk.push(node);  
            node = node->right;  
        }  
    }  
  
  
public:  
    BSTIterator(TreeNode *root, bool forward)  
            : forward{forward} {  
        if (forward)  
            push_all_left(root);  
        else  
            push_all_right(root);  
    }  
  
    bool has_next() {  
        return !stk.empty();  
    }  
  
    int next() {  
        TreeNode *node = stk.top();  
        stk.pop();  
        if (forward)  
            push_all_left(node->right);  
        else  
            push_all_right(node->left);  
        return node->val;  
    }  
  
    int peek() {  
        return stk.top()->val;  
    }  
};  
  
// T(n) = O(n)  
// Space(n) = O(h)  
class Solution {  
    bool findTarget(TreeNode *root, int k) {  
        BSTIterator left(root, true), right(root, false);  
        while (left.has_next() && right.has_next()) {  
            int l = left.peek();  
            int r = right.peek();  
            if (l >= r)  
                return false;  
  
            if (l + r < k)  
                left.next();  
            else if (l + r > k)  
                right.next();  
            else  
                return true;  
        }  
        return false;  
    }  
};
```