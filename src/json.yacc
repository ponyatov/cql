%{
    #include "app.hpp"
%}

%defines %union { int n; float f; char c; std::string *s; bool b; }

%token<c> CHAR
%token<s> STR
%token<b> BOOL
%token<n> INT

%token LC RC LQ RQ COLON COMMA

%token baseCPUIndex

%%
JSON:| JSON ex

ex  : baseCPUIndex COLON INT { config.base_cpu_index = $3; }
    | STR  { std::clog << "\nstr:"  << *$1; }
    | BOOL { std::clog << "\nbool:" <<  $1; }
    | CHAR { std::clog << "\nchar:" <<  $1; }
    | LC | RC
    | LQ | RQ
    | COLON | COMMA
