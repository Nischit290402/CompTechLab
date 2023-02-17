%{
#include "q2.tab.h"
void yyerror(char *s);
int yylex();
%}

%%

[0-9]*   { return operand; }
[+\-*/]  { return operator; }
[ ]      {}
\n       { return *yytext; }
.        { return *yytext; }

%%

int yywrap() { return 1; }
