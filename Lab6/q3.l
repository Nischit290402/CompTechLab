%{
#include "q3.tab.h"
void yyerror(char *s);
int yylex();
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%%
(am|is|are|was|were|being|been|be|have|has|had|do|does|did|will|would|shall|should|may|might|must|can|could) { printf("%s ",yytext);return hv; }
[a-zA-Z]+ { printf("%s ",yytext);return nhv; }
[0-9]+         { return *yytext; }
\n             { return *yytext; }
%%

int yywrap() { return 1; }


