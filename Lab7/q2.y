%{
#include <stdio.h>
#include <string.h>
int yylex();
void yyerror(char *s);
%}

%token <string> str special

%union {
    char* string;
}

%type <string> expr rec domain username url
%%

stmt: error '\n' {YYABORT;}
| expr '\n' {YYACCEPT;}
;

expr: username '@' url
;

url: domain '.' tld {if(strlen($$) > 64) YYABORT;}
;

tld: str
;

username: rec {if(strlen($$) > 64) YYABORT;}
;

rec: str '.' rec 
| str '-' rec
| str '_' rec
| str 
;

domain: domain '.' str
| domain '-' str
| str
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
