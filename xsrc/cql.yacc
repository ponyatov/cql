%{
    #include "cql.hpp"
%}

%defines %union { Object *o; }

%token<o> CHAR
%token<o> STR
%token<o> INT
%token<o> BOOL

%token COLON COMMA LQ RQ LC RC

%token<o> SN

%type<o> ex item

%%
JSON:
    | JSON item { std::clog << $2->dump() << "\n"; }
    | JSON ex | JSON parens

ex  : CHAR      { std::clog << $1->dump(); $$ = $1; }
    | STR       { std::clog << $1->dump(); $$ = $1; }
    | INT       { std::clog << $1->dump(); $$ = $1; }
    | BOOL      { std::clog << $1->dump(); $$ = $1; }

item: STR COLON ex  { $$ = new param($1->val(),$3);    }
    | STR COLON LQ  { $$ = new Object();        }
    | SN  COLON STR { $$ = new sn($3->val());   }

parens  : LQ | RQ
        | LC | RC
        | COLON | COMMA
