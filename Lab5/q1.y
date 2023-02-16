%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token A B

%%

stmt: error '\n' {YYABORT;}
| S '\n' {YYACCEPT;}
;

S: 
A S
| S1
;

S1:
S1 B
|
;
%%

int main(void) {
    while(1) {
        if(yyparse()) {
            printf("Rejected\n");
        } else {
            printf("Accepted\n");
        }
    }
    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
}
