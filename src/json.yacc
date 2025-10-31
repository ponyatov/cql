%{
    #include "syntax.hpp"
%}

%defines %union { int n; float f; std::string *s; }

%%
JSON:
