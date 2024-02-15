#include<string.h>
#include<stdio.h>
#include<stdlib.h>
#include "./symbol_table_definitions.h"

extern void yyerror(char *s);

SymbolTable *symlook(char *name){
	char *p;
	for(SymbolTable *curr = symtab; curr < &symtab[NSYMS]; curr++){
		if(curr->name && !strcmp(curr->name, name)){
			return curr;
		}
		if(!curr->name){
			curr->name = strdup(name);
			return curr;
		}
	}
	yyerror("Too Many Symbols");
	// is there any difference b/w exit(1) and return 1;
	exit(1);
	// return 1;

}







