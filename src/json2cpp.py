#!/usr/bin/env python3

import os, sys, re
import json

if __name__ == "__main__":
    with open(sys.argv[1], 'r') as jsn:
        with open('inc/config.hpp','w') as hpp:
            print('#pragma once', file=hpp)
            jsn = json.load(jsn)
            print(f'#define baseCPUIndex {jsn["baseCPUIndex"]}',file=hpp)
            print(f'#define groups_sz {len(jsn["groups"])}',file=hpp)
            print("")
            print(jsn)
