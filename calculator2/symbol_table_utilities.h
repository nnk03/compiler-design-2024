
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "./symbol_table_definitions.h"

extern void yyerror(char *s);

void print_all(){
	for(SymbolTable *curr = sym_table; curr < &sym_table[MAX_VARIABLES]; ++curr){
		if(!curr->name) return;
		printf("%s : %g\n", curr->name, curr->value);
	}
}

SymbolTable *look_up(char *name){
	
	for(SymbolTable *curr = sym_table; curr < &sym_table[MAX_VARIABLES]; ++curr){
		if(curr->name && !strcmp(curr->name, name)){
			return curr;
		}
		if(!curr->name){
			curr->name = strdup(name);
			yyerror("VARIABLE NOT DECLARED");
			exit(1);
			// return curr;
		}
	}
	yyerror("TOO MANY VARIABLES");

	exit(1);
}

SymbolTable *insert(char *name, double value){
	for(SymbolTable *curr = sym_table; curr < &sym_table[MAX_VARIABLES]; ++curr){
		if(curr->name && !strcmp(curr->name, name)){
			yyerror("VARIABLE ALREADY DECLARED");
			exit(1);
		}
		if(!curr->name){
			curr->name = strdup(name);
			curr->value = value;
			printf("%s\n : %g\n", curr->name, curr->value );
			return curr;
		}
	}
	yyerror("TOO MANY VARIABLES");

	exit(1);
}












