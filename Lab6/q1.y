%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
float res = 0;
%}

%token <realval> id
%left '+' '-'
%left '*' '/'
%left UMINUS

%union {
    float realval;
}

%type <realval> stmt expr

%%

stmt: error '\n' {YYABORT;}
| expr '\n' {res = $1; YYACCEPT;}
;

expr :
    expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { if($3==0) {printf("Divide by zero error!\n"); YYABORT;} $$ = $1 / $3; }
    | '-' expr %prec UMINUS { $$ = -$2; }
    | '(' expr ')' { $$ = $2; }
    | id { $$ = $1; }
%%

int main(void) {
    while(1) {
        if(yyparse()) {
            printf("Rejected\n");
        } else {
            printf("Accepted\n");
            printf("Result: %0.2f\n", res);
        }
        res = 0;
    }
    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
}
