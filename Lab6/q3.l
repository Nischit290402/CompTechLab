%{
#include "q3.tab.h"
void yyerror(char *s);
int yylex();
%}

%%
(am|is|are|was|were|being|been|be|have|has|had|do|does|did|will|would|shall|should|may|might|must|can|could) { yylval.string = yytext;return hv; }
[a-zA-Z]+ { yylval.string = yytext;return nhv; }
\n             { return *yytext; }
.              {}
%%

int yywrap() { return 1; }