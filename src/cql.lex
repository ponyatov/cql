%{
    #include "cql.hpp"
    char  *yyfile = nullptr;
    static char    s[0x100];
    static uint8_t sp = 0;
%}

%option noyywrap yylineno

%x str

%%

\"              {BEGIN(str); sp = 0; }
<str>\"         {BEGIN(INITIAL); s[sp] = 0; yylval.o = new Str(s); return STR; }
<str>.          {s[sp++] = yytext[0]; }

:               {return COLON;}

"true"          {yylval.o = new Bool(true ); return BOOL;}
"false"         {yylval.o = new Bool(false); return BOOL;}

[0-9]+          TOKEN(Int,INT)

[ \t\r\n]+      {}      // drop spaces
.               TOKEN(Char, CHAR)
