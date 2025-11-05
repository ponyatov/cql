#include "cql.hpp"

extern int main(int argc, char *argv[]) {  //
    arg(0, argv[0]);
}

extern void arg(int argc, char *argv) {  //
    std::clog << "arg[" << argc << "] = <" << argv << ">\n";
}
