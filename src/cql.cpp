#include "cql.hpp"

#include <iostream>
#include <thread>

void hello() { std::clog << "Hello\n"; }

int main(int argc, char *argv[]) {
    arg(0, argv[0]);
    //
    std::thread t(hello);
    std::this_thread::yield();
    //
    for (int i = 1; i < argc; i++) {
        arg(i, argv[i]);
        yyfile = argv[i];
        assert(yyin = fopen(yyfile, "r"));
        yyparse();
        fclose(yyin);
        yyfile = nullptr;
    }
    //
    t.join();
    return 0;
}

void arg(int argc, char *argv) {  //
    std::clog << "arg[" << argc << "] = <" << argv << ">\n";
}

void yyerror(std::string msg) {
    std::cerr << "\n\n"
              << yyfile << ':' << yylineno << ' ' << msg << " [" << yytext
              << "]\n\n";
    exit(-1);
}
