%{
#include "q2.tab.h"
void yyerror(char *s);
int yylex();
%}

%%

[a-zA-Z0-9]+   { yylval.string = yytext; return str; }
\n             { return *yytext; }
.              { return *yytext; }

%%

int yywrap() { return 1; }