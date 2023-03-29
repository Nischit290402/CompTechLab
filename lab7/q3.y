%{
#include <stdio.h>
int yylex();
void yyerror(char *s);

%}

%token dig

%union {
    char* string;
}

%%

stmt: error '\n' {YYABORT;}
| dig '\n' {YYACCEPT;}
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
