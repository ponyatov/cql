// #include "app.hpp"

// int main(int argc, char *argv[]) {
//     arg(0, argv[0]);
//     //
//     for (int i = 1; i < argc; i++) {
//         arg(i, argv[i]);
//         yyfile = argv[i];
//         assert(yyin = fopen(yyfile, "r"));
//         yyparse();
//         fclose(yyin);
//         yyfile = nullptr;
//     }
//     std::clog << '\n';
//     return 0;
// }

// void arg(int argc, char *argv) {  //
//     std::clog << "arg[" << argc << "] = <" << argv << ">\n";
// }

// void yyerror(std::string msg) {
//     std::cerr << "\n\n"
//               << yyfile << ':' << yylineno << ' ' << msg << " [" << yytext
//               << "]\n\n";
//     exit(-1);
// }
