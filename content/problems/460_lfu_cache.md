---
tags:
---
![[problems/pictures/Pasted image 20241014010642.png]]
![[problems/pictures/Pasted image 20241014010650.png]]
![[problems/pictures/Pasted image 20241014010658.png]]




```c++
template <typename T> using vec = std::vector<T>;

class LFUCache {
    struct Node {
        int key, val, freq;
    };

    int minfreq, capacity;
    std::unordered_map<int, std::list<Node>::iterator> key_table;
    std::unordered_map<int, std::list<Node>> freq_table;

public:
    LFUCache(int _capacity) {
        minfreq = 0;
        capacity = _capacity;
        key_table.clear();
        freq_table.clear();
    }
    
    int get(int key) {
        if (capacity == 0)
            return -1;

        auto it = key_table.find(key);
        if (it == key_table.end())
            return -1;

        auto node = it -> second;
        int val = node -> val, freq = node -> freq;
        freq_table[freq].erase(node);

        if (freq_table[freq].size() == 0) {
            freq_table.erase(freq);
            if (minfreq == freq)
                minfreq += 1;
        }

        freq_table[freq + 1].push_front({key, val, freq + 1});
        key_table[key] = freq_table[freq + 1].begin();
        return val;
    }
    
    void put(int key, int value) {
        if (capacity == 0) return;
        auto it = key_table.find(key);
        if (it == key_table.end()) {
            if (key_table.size() == capacity) {
                auto it2 = freq_table[minfreq].back();
                key_table.erase(it2.key);
                freq_table[minfreq].pop_back();
                if (freq_table[minfreq].size() == 0)
                    freq_table.erase(minfreq);
            } 
            freq_table[1].push_front({key, value, 1});
            key_table[key] = freq_table[1].begin();
            minfreq = 1;
        } else {
            auto node = it -> second;
            int freq = node -> freq;
            freq_table[freq].erase(node);
            if (freq_table[freq].empty()) {
                freq_table.erase(freq);
                if (minfreq == freq)
                    minfreq += 1;
            }
            freq_table[freq + 1].push_front({key, value, freq + 1});
            key_table[key] = freq_table[freq + 1].begin();
        }
    }
};
```
