%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
int operator_count = 0;
int operand_count = 0;
%}

%token hv nhv

%%

stmt: error '\n' {YYABORT;}
| S '\n' {YYACCEPT;}
;

S: 
| S T {}
;

T:
 hv {printf(" : is helping verb\n");}
| nhv {printf(" : is not helping verb\n");}
;
%%

int main(void) {
    while(1) {
        if(yyparse()) {
            printf("Input Rejected\n");
        } else {
            printf("Input Accepted\n");
        }
    }
    return 0;
}

void yyerror(char *s) {
    // fprintf(stderr, "error: %s\n", s);
}
