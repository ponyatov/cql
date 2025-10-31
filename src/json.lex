%{
    #include "json.hpp"
%}

%option c++
%option yyclass="json"
%option prefix="json_"

%option noyywrap yylineno
%%
