%{
#include "q3.tab.h"
void yyerror(char *s);
int yylex();
%}

%%

[0-9]          { return dig;}
\n             { return *yytext; }
.              { return *yytext; }

%%

int yywrap() { return 1; }
