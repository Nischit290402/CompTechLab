%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token a b

%%

stmt: error '\n' {YYABORT;}
| expr '\n' {YYACCEPT;}
;
expr:
| a expr b
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
