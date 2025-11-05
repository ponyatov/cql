#include "cql.hpp"

extern int main(int argc, char *argv[]) {  //
    arg(0, argv[0]);
    for (int i = 1; i < argc; i++) {  //
        arg(i, argv[i]);
        yyfile = argv[i];
        assert(yyin = fopen(yyfile, "r"));
        yyparse();
        fclose(yyin);
        yyfile = nullptr;
    }
}

extern void arg(int argc, char *argv) {  //
    std::clog << "arg[" << argc << "] = <" << argv << ">\n";
}

extern void yyerror(std::string msg) {  //
    exit(-1);
}

Object::Object() {}
Object::~Object() {}

#include <cxxabi.h>

std::string Object::tag() {
    std::string ret =
        abi::__cxa_demangle(typeid(*this).name(), NULL, NULL, nullptr);
    for (char &c : ret) c = tolower(c);
    return ret;
}

std::string Object::val() { return ""; }

std::string Object::dump() { return tag() + ":" + val() + "\n"; }

Char::Char(char *V) : Object(), value(V[0]) {}

std::string Char::val() {
    std::ostringstream os;
    os << value;
    return os.str();
}

Int::Int(char *V) : Object(), value(atoi(V)) {}

std::string Int::val() {
    std::ostringstream os;
    os << value;
    return os.str();
}

Bool::Bool(bool V) : Object(), value(V) {}

std::string Bool::val() {
    std::ostringstream os;
    os << value;
    return os.str();
}

Str::Str(char *V) : Object(), value(V) {}
std::string Str::val() { return value; }
