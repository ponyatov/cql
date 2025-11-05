#!/usr/bin/env python3

import os, sys, re
import json

class S:
    def __init__(self, start='', end=''):
        self.start = start
        self.end = end
        self.nest = []

    def __floordiv__(self, s):
        if isinstance(s, str): s = S(s)
        self.nest.append(s); return self

    def gen(self, depth=0):
        def tab(depth): return ' ' * 4 * depth
        ret = ''
        ret += f'{tab(depth)}{self.start}\n' if self.start else ''
        for i in self.nest: ret += i.gen(depth + 1)
        ret += f'{tab(depth)}{self.end}\n' if self.end else ''
        return ret

    def __str__(self): return self.gen()

class SRC:
    def __init__(self, path):
        self.path = path
        self.name = path.split('/')[-1]
        self.base = re.sub(r'\.[a-z]+$', r'', self.name)
        self.nest = []

    def __floordiv__(self, s):
        self.nest.append(s); return self

    def write(self):
        with open(self.path, 'w') as f:
            for i in self.nest:
                print(i, file=f)

class C(SRC):
    def __init__(self, path):
        super().__init__(path)
        self // f'#include "{self.base}.hpp"'
        self.config = S('CONFIG config = {', '};'); self // self.config
        self.cpuindex = S('.baseCPUIndex = 0,'); self.config // self.cpuindex
        self.groups = S('.groups = {', '},'); self.config // self.groups

class H(SRC):
    def __init__(self, path):
        super().__init__(path)
        self // '#pragma once' // '#include "types.hpp"'
        self // 'extern CONFIG config;'

if __name__ == "__main__":
    jsn, cpp, hpp = sys.argv[1:3 + 1]
    hpp_base = hpp.split('/')[-1]
    with open(jsn, 'r') as jsn:
        c = C(cpp); h = H(hpp)
        config = json.load(jsn)
        c.cpuindex.start = f'.baseCPUIndex = {config["baseCPUIndex"]},'
        c.write(); h.write()
        # #
        # print(f'#include "{hpp_base}"', file=cpp)
        # print(f'#pragma once', file=hpp)
        # print(f'#include "types.hpp"', file=hpp)
        # print(f'extern CONFIG config;', file=hpp)
        # config = json.load(jsn)
        # print(f'\nCONFIG config = {{', file=cpp)
        # print(f'\t.baseCPUIndex = {config["baseCPUIndex"]},', file=cpp)
        # print(f'\t.groups = {{', file=cpp)
        # print(f'\t}}\n}};', file=cpp)
        # #
        # for groups in config['groups']:
        #     name = groups['name']
        #     if re.match(r'^[0-9]+.+',name): name = '_'+name
        #     print(f'extern GROUP {name};',file=hpp)
        #     print(groups)
        # #
        # print(config)
