%{

#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include "./symbol_table_utilities.h"
void yyerror(char *s);
int yylex();

extern struct SymbolTable *look_up(char *name);
extern struct SymbolTable *insert(char *name, double value);



%}
%union{
	double dval;
	char *name;
	struct SymbolTable *ptr;
}

%token <dval> NUMBER;
%token <name> NAME;

%left '+' '-'
%left '*' '/'

%nonassoc UMINUS

%type <ptr> E
%type <ptr> statement



%%

program :
		program statement '\n'
		|
		;

statement :
		  NAME '=' E 	{
								$$ = insert($1, $3->value);
								// print_all();
							}
		  | E				{
								printf("%g\n", $1->value);
							}
		;

E :
  NUMBER				{ $$->value = $1;}
  | NAME				{ $$->value = (look_up($1))->value; }
  | E '+' E				{ $$->value = $1->value + $3->value; }
  | E '-' E				{ $$->value = $1->value - $3->value; }
  ;


%%

void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}

int main(){
	yyparse();
  // | E '*' E				{ $$ = $1 * $3; }
  // | E '/' E				{ $$ = $1 / $3; }
  // | '-' E %prec UMINUS	{ $$ = -$2; }
}








