%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
char* res = "";
%}

%token <string> id

%union {
    char* string;
}

%type <string> stmt

%%

stmt: error '\n' {YYABORT;}
| id '\n' {res = $1; YYACCEPT;}
;
%%

int main(void) {
    while(1) {
        if(yyparse()) {
            printf("Rejected\n");
        } else {
            printf("Accepted\n");
            // convert binary string to decimal
            int decimal = 0;
            int i = 0;
            while (res[i] != '\n') {
                decimal = decimal * 2 + (res[i] - '0');
                i++;
            }
            printf("Decimal: %d\n", decimal);
        }
        res = "";
    }
    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
}
