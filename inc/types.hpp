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
};

struct group {
    std::string name;
    int duration;
    bool loop;
    int freq;
    int packetSize;
    std::vector<sensor> sensors;
};

struct config {
    int baseCPUIndex;
    std::vector<group> groups;
};
