%{
#include "q1.tab.h"
void yyerror(char *s);
int yylex();
%}

%%

[01]*         { yylval.string = yytext; return id;}
[ ]            {}
\n             { return *yytext; }
.              { return *yytext; }

%%

int yywrap() { return 1; }
