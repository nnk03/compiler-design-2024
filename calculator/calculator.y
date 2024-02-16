%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "./symbol_table.h"
void yyerror(char *);
int yylex(void);

%}
%union{
    double dval;
	struct SymbolTable *ptr;
}


%token <ptr> VARIABLE
%token <dval> NUMBER

%left '+' '-'
%left '*' '/'

%nonassoc UMINUS

%type <dval> expr


%%

program :
        program statement '\n'
        |
        ;

statement :
          expr                  { printf("%g\n", $1); }
          | VARIABLE '=' expr   { $1->value = $3; print_all();}
          ;

expr :
     NUMBER
     | VARIABLE             { $$ = $1->value; }
     | expr '+' expr        { $$ = $1 + $3; }
     | expr '-' expr        { $$ = $1 - $3; }
     | '-' expr %prec UMINUS { $$ = -$2; }
     ;





%%

void yyerror(char *s){
    fprintf(stderr, "%s\n", s);
}


int main(){
    yyparse();
}














