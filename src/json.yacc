%{
    #include "json.hpp"
%}

%define api.token.prefix {JSON_}

/* %define api.prefix {json_} */
%defines %union { int n; float f; std::string *s; }

%%
JSON:
