%{
#include "q4.tab.h"
void yyerror(char *s);
int yylex();
%}

%%

a  { return a;}
b  { return b;}
\n { return *yytext; }
.  { return *yytext; }

%%

int yywrap() { return 1; }
