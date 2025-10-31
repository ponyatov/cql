%{
    #include "syntax.hpp"
    char *yyfile = nullptr;
    char s[0x100];
    uint8_t sp=0;
%}

%option noyywrap yylineno

%x str

%%

\"          {BEGIN(str); sp=0; }
<str>\"     {BEGIN(INITIAL); s[sp]=0; yylval.s = new std::string(s); return STR;}
<str>.      {s[sp++] = yytext[0];}

[ \t\r\n]+      {}

\{              { return LC; }
\}              { return RC; }

.               { yylval.c = yytext[0]; return CHAR; }
