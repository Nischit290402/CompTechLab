%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}


%%

stmt: error '\n' {YYABORT;}
| S {YYACCEPT;}
;

S:
| A S 
;
A:  
'(' S ')' 
| '{' S '}' 
;
%%

int main(void) {
    
    if(yyparse()) {
        printf("Not Balanced\n");
    } else {
        printf("Perfectly balanced (As all things should be :P)\n");
    }
    
    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
}
