#!/usr/bin/env python3

import os, sys, re
import json

if __name__ == "__main__":
    json,cpp,hpp = sys.argv[1:3+1]
    hpp_base = hpp.split('/')[-1]
    with open(json,'r') as json:
        with open(cpp,'w') as cpp:
            print(f'#include "{hpp_base}"',file=cpp)
            with open(hpp,'w') as hpp:
                pass

    # with open(sys.argv[1], 'r') as jsn:
    #     with open(sys.argv[2], 'w') as cpp:
    #         with open(sys.argv[3], 'w') as hpp:
    #             print('#pragma once', file=hpp)
    #             jsn = json.load(jsn)
    #             print(f'#define baseCPUIndex {jsn["baseCPUIndex"]}',file=hpp)
    #             print(f'#define groups_sz {len(jsn["groups"])}',file=hpp)
    #             print("")
    #             print(jsn)
