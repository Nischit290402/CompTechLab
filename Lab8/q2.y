%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
float res = 0;
%}

%token <realval> id

%union {
    float realval;
}

%type <realval> stmt expr D F

%%

stmt: error '\n' {YYABORT;}
| expr '\n' {res = $1; YYACCEPT;}
;

expr: D '.' F {$$ = $1 + $3;}
| D {$$ = $1;}
;
D : D id {$$ = 2*$1 + $2;}
| id {$$ = $1;}
;
F : id F {$$ = 0.5*($1 + $2);}
| id {$$ = 0.5*$1;}
;
%%

int main(void) {
    while(1) {
        if(yyparse()) {
            printf("Rejected\n");
        } else {
            printf("Accepted\n");
            printf("Decimal: %f\n", res);
        }
        res = 0;
    }
    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
}
