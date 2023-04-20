%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token id
%left '+' '-'
%left '*' '/'

%type stmt expr

%%

stmt: error '\n' {YYABORT;}
| expr '\n' {YYACCEPT;}
;

expr :
    expr '+' expr { printf("+");}
    | expr '-' expr { printf("-");}
    | expr '*' expr { printf("*");}
    | expr '/' expr { printf("/");}
    | '(' expr ')'
    | id { printf("%c", $1); }
%%

int main(void) {
    while(1) {
        if(yyparse()) {
            printf("\nRejected\n");
        } else {
            printf("\nAccepted\n");
        }
    }
    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
}
