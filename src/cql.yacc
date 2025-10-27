%{
    #include "cql.hpp"
%}

%defines %union { int n; float f; std::string* s; }

%%
syntax:
