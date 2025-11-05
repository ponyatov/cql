#!/usr/bin/env python3

import sys, re
import json

class Container:
    def __init__(self):
        self.nest = []
        self.slot = {}

    def __floordiv__(self, s):
        if isinstance(s, str): s = S(s)
        self.nest.append(s); return self

    def __getitem__(self, name):
        return self.slot[name]

    def __setitem__(self, name, what):
        self.slot[name] = what

class S(Container):
    def __init__(self, start=None, end=None):
        super().__init__()
        self.start = start
        self.end = end

    def gen(self, depth=0):
        def tab(depth): return ' ' * 4 * depth
        ret = ''
        ret += f'{tab(depth)}{self.start}\n' if self.start is not None else ''
        for i in self.nest: ret += i.gen(depth + 1)
        ret += f'{tab(depth)}{self.end}\n' if self.end is not None else ''
        return ret

    def __str__(self): return self.gen()

class SRC(Container):
    def __init__(self, path):
        super().__init__()
        self.path = path
        self.name = path.split('/')[-1]
        self.base = re.sub(r'\.[a-z]+$', r'', self.name)

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
        #
        for g in config['groups']:
            name = g["name"]
            assert not re.match(r'^[0-9]+', name)
            h // f'extern GROUP {name};'
            c.groups // f'&{name},'
            #
            c[name] = (S(f'GROUP {name} = {{', '};') // f'.name = "{name}",')
            c // c[name]
            c[name] // f'.duration = {g["duration"]},'
            if g["loop"]:
                c[name] // f'.loop = true,'
            else:
                c[name] // f'.loop = false,'
            c[name] // f'.freq = {g["freq"]},'
            c[name] // f'.packetSize = {g["packetSize"]},'
            c[name] // S('.sensors = {', '},')

        #
        c.write(); h.write()
