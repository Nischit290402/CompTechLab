%{
#include "q1.tab.h"
void yyerror(char *s);
int yylex();
%}

%%

A        { return A; }
B        { return B; }
\n       { return *yytext; }
.        { return *yytext; }

%%

int yywrap() { return 1; }
