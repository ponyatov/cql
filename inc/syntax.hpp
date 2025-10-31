#pragma once

#include <cstdio>
#include <string>

/// @defgroup script script

/// @defgroup syntax syntax
/// @ingroup script
/// @brief command/syntax parser
/// @{

/// @name lexer
/// @{
extern int yylex();   ///< lexer
extern int yylineno;  ///< line number
extern char *yyfile;  ///< current file name
extern FILE *yyin;    ///< file handler
extern char *yytext;  ///< lexeme (token) string value

/// @}

/// @name parser
/// @{
extern void parse(char *);             ///< parse string
extern int yyparse();                  ///< parser
extern void yyerror(std::string msg);  ///< syntax error callback
/// @}

#include "json.yacc.hpp"
/// @}
