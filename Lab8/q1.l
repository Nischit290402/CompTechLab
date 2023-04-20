%{
#include "q1.tab.h"
void yyerror(char *s);
int yylex();
%}

%%

[a-zA-Z]       { yylval = yytext[0]; return id;}
[+\-*/()]      { return *yytext; }
[ ]            {}
\n             { return *yytext; }
.              { return *yytext; }

%%

int yywrap() { return 1; }
