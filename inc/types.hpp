#pragma once

#include <string>
#include <vector>

struct udp {
    uint8_t ip[4];
    uint16_t port;
};

struct sensor {
    std::string name;
    udp src;
    udp dst;
    uint32_t sn;
    std::string dataPath;
};

struct group {
    std::string name;
    uint duration;
    bool loop;
    uint freq;
    uint packetSize;
    std::vector<sensor> sensors;
};

struct config {
    uint baseCPUIndex;
    std::vector<group> groups;
};
