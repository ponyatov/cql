// %{
//     #include "app.hpp"
// %}

// %defines %union { uint n; float f; char c; std::string *s; bool b; }

// %token<c> CHAR
// %token<s> STR
// %token<b> BOOL
// %token<n> UINT

// %token LC RC LQ RQ COLON COMMA

// %token baseCPUIndex NAME SRC DST

%%
JSON:
// JSON:| JSON ex | JSON generic | JSON ignore

// ex  : baseCPUIndex COLON UINT {
//         assert( $3 >= 0 && $3 <= 24);
//         config.base_cpu_index = $3;
//         std::clog << "\nconfig.base_cpu_index = " << $3; }

// ex  : NAME COLON STR { std::clog << "\nname=" << $3; }
// ex  : SRC  COLON STR { std::clog << "\nsrc="  << $3; }
// ex  : DST  COLON STR { std::clog << "\ndst="  << $3; }

// generic : CHAR { std::clog << "\nchar:" <<  $1; }
//         | UINT { std::clog << "\nuint:" <<  $1; }
//         | STR  { std::clog << "\nstr:"  << *$1; }
//         | BOOL { std::clog << "\nbool:" <<  $1; }

// ignore  : LC | RC
//         | LQ | RQ
//         | COLON | COMMA
