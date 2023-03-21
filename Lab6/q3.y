%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}


%union {
    char* string;
}

%token <string> hv nhv

%%

stmt: error '\n' {YYABORT;}
| S '\n' {YYACCEPT;}
;

S:
| S T
;

T:
hv {printf("%s : is helping verb\n", $1);}
| nhv {printf("%s : is not helping verb\n", $1);}
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
    fprintf(stderr, "error: %s\n", s);
}