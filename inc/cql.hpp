#pragma once

#include <cassert>
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <sstream>
#include <string>

extern int main(int argc, char *argv[]);
extern void arg(int argc, char *argv);

struct Object {
    Object();
    virtual ~Object();
    virtual std::string tag();
    virtual std::string val();
    std::string dump();
};

struct Char : Object {
    char value;
    Char(char *);
    std::string val();
};

struct Int : Object {
    int value;
    Int(char *);
    std::string val();
};

struct Bool : Object {
    bool value;
    Bool(bool);
    std::string val();
};

struct Str : Object {
    std::string value;
    Str(char *);
    std::string val();
};

struct param : Object {
    std::string name;
    Object *value;
    param(std::string name, Object *value);
    std::string val();
};

struct sn : Object {
    uint32_t value;
    sn(std::string);
    std::string val();
};

extern int yylex();
extern int yylineno;
extern FILE *yyin;
extern char *yyfile;
extern char *yytext;
extern int yyparse();
extern void yyerror(std::string msg);
#include "cql.yacc.hpp"
#define TOKEN(C, X)               \
    {                             \
        yylval.o = new C(yytext); \
        return X;                 \
    }
