%{
#include "q2.tab.h"
void yyerror(char *s);
int yylex();
%}

%%

[(){}]  { return yytext[0];}
\n   {}
.   {}
%%

int yywrap() { return 1; }
