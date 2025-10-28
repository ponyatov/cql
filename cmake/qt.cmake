# export Qt6_DIR=/usr/lib/x86_64-linux-gnu/cmake/Qt6
# list(APPEND CMAKE_PREFIX_PATH $ENV{Qt6_DIR})
find_package(Qt6 REQUIRED COMPONENTS Core Widgets)
