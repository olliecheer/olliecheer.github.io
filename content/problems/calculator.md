
### basic calculator

```c++
namespace basic_calculator {
int calculate(std::string s) {
  auto stack = std::stack<int>{};
  int res = 0;
  int nr = s.size();
  char sign = '+';

  for (int i = 0; i < nr; i++) {
    auto c = s[i];
    if (std::isdigit(c)) {
      int num = 0;
      while (i < nr && std::isdigit(s[i])) {
        num = num * 10 + (s[i] - '0');
        i++;
      }
      i--;

      if (sign == '+') {
        res += num;
      } else {
        res -= num;
      }
    } else if (c == '+') {
      sign = '+';
    } else if (c == '-') {
      sign = '-';
    } else if (c == '(') {
      stack.push(res);
      stack.push(sign);
      res = 0;
      sign = '+';
    } else if (c == ')') {
      sign = stack.top();
      stack.pop();
      res *= sign;
      res += stack.top();
      stack.pop();
    }
  }

  return res;
}
} // namespace basic_calculator
```



### basic calculator ii
```c++
namespace basic_calculator_ii {
int calculator(std::string s) {
  auto stack = std::stack<int>{};
  char sign = '+';
  int num = 0;

  for (int i = 0; i < s.size(); i++) {
    auto c = s[i];
    if (c == ' ') {
      continue;
    }

    if (std::isdigit(c)) {
      num = num * 10 + c - '0';
    }

    if (!std::isdigit(c) || i == s.size() - 1) {
      if (sign == '+') {
        stack.push(num);
      } else if (sign == '-') {
        stack.push(-num);
      } else if (sign == '*') {
        auto last_num = stack.top();
        stack.pop();
        stack.push(last_num * num);
      } else if (sign == '/') {
        auto last_num = stack.top();
        stack.pop();
        stack.push(last_num / num);
      } else {
        abort();
      }
      sign = c;
      num = 0;
    }
  }

  int res = 0;
  while (!stack.empty()) {
    res += stack.top();
    stack.pop();
  }

  return res;
}
} // namespace basic_calculator_ii
```


### basic calculator iii
```c++
namespace basic_calculator_iii {
int i = 0;

int calculate(std::string s) {
  auto stack = std::stack<int>{};
  char op = '+';
  int num = 0;

  while (i < s.size()) {
    auto c = s[i];
    i++;

    if (std::isdigit(c)) {
      num = num * 10 + (c - '0');
    }

    if (c == '(') {
      num = calculate(s);
    }

    if (i >= s.size() || c == '+' || c == '-' || c == '*' || c == '/' ||
        c == ')') {
      if (op == '+') {
        stack.push(num);
      } else if (op == '-') {
        stack.push(-num);
      } else if (op == '*') {
        auto last_num = stack.top();
        stack.pop();
        stack.push(last_num * num);
      } else if (op == '/') {
        auto last_num = stack.top();
        stack.pop();
        stack.push(last_num / num);
      }
      op = c;
      num = 0;
    }
    if (c == ')')
      break;
  }

  int res = 0;
  while (!stack.empty()) {
    res += stack.top();
    stack.pop();
  }

  return res;
}
} // namespace basic_calculator_iii
```