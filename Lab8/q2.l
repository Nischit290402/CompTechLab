%{
#include "q2.tab.h"
void yyerror(char *s);
int yylex();
%}

%%

[01]           { yylval.realval = atof(yytext); return id;}
\.             { return *yytext; }
[ ]            {}
\n             { return *yytext; }
.              { return *yytext; }

%%

int yywrap() { return 1; }
