%{
    #include "cql.hpp"
    char *yyfile = nullptr;
%}

%option noyywrap yylineno

%%
.       {yyerror("");}
