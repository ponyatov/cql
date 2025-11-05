%{
    #include "cql.hpp"
%}

%defines %union { Object *o; }

%token<o> CHAR
%token<o> STR
%token<o> INT
%token<o> BOOL

%token COLON

%type<o> ex item

%%
JSON:
    | JSON item | JSON ex

ex  : CHAR      { std::clog << $1->dump(); $$ = $1; }
    | STR       { std::clog << $1->dump(); $$ = $1; }
    | INT       { std::clog << $1->dump(); $$ = $1; }
    | BOOL      { std::clog << $1->dump(); $$ = $1; }

item: STR COLON ex  { std::clog << '\t' << $1->val() << "=" << $3->val() << "\n"; }
