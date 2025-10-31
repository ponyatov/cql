%{
    #include "app.hpp"
    char *yyfile = nullptr;
    char s[0x100]; uint8_t sp=0;
%}

%option noyywrap yylineno

%x str

%%

\"          {BEGIN(str); sp=0; }
<str>\"     {BEGIN(INITIAL); s[sp]=0; yylval.s = new std::string(s); return STR;}
<str>.      {s[sp++] = yytext[0];}

[ \t\r\n]+      {}

"{"             { return LC; }
"}"             { return RC; }
"["             { return LQ; }
"]"             { return RQ; }
":"             { return COLON; }
","             { return COMMA; }

"true"          { yylval.b = true ; return BOOL; }
"false"         { yylval.b = false; return BOOL; }

.               { yylval.c = yytext[0]; return CHAR; }
