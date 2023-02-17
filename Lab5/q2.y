%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
int operator_count = 0;
int operand_count = 0;
%}

%token operator operand

%%

stmt: error '\n' {YYABORT;}
| expr '\n' {YYACCEPT;}
;

expr: 
operand operator expr {operator_count++; operand_count++;}
| operand {operand_count++;}
;

%%

int main(void) {
    while(1) {
        if(yyparse()) {
            printf("Rejected\n");
        } else {
            printf("Accepted\n");
            printf("operator count = %d, operand count = %d\n", operator_count, operand_count);
        }
        operand_count = 0;
        operator_count = 0;
    }
    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
}
