#pragma once

#include <string>
#include <vector>

typedef std::string path;

struct udp {
    uint8_t ip[4];
    uint16_t port;
};

struct SENSOR {
    std::string name;
    udp src;
    udp dst;
    uint32_t sn;
    path dataPath;
};

struct GROUP {
    std::string name;
    uint duration;
    bool loop;
    uint freq;
    uint packetSize;
    std::vector<SENSOR*> sensors;
};

struct CONFIG {
    uint baseCPUIndex;
    std::vector<GROUP*> groups;
};
