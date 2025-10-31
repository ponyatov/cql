#pragma once

#include <cstdint>
#include <string>
#include <vector>

struct IP4 {
    uint8_t ip[4];
    uint16_t port;
};

struct SENSOR {
    std::string name;
    IP4 src;
    IP4 dst;
    uint32_t sn;
};

struct GROUP {
    std::string name;
    uint duration;
};

struct CONFIG {
    uint base_cpu_index;
    std::vector<GROUP> groups;
};

extern CONFIG config;
