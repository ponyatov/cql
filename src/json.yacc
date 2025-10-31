%{
    #include <iostream>
    #include "syntax.hpp"
%}

%defines %union { int n; float f; char c; std::string *s; }

%token<c> CHAR
%token<s> STR

%token LC RC LQ RQ COLON

%%
JSON:| JSON ex

ex  : CHAR { std::clog << "\nchar:" <<  $1; }
    | STR  { std::clog << "\nstr:"  << *$1; }
    | LC | RC
    | LQ | RQ
    | COLON
