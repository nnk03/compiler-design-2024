%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include "y.tab.h"
#include<math.h>

void yyerror(char *s);

extern struct SymbolTable *look_up(char *name);
extern struct SymbolTable *insert(char *name, double value);

%}

digit [0-9]
small [a-z]
caps [A-Z]


%%

({small}|{caps})({small}|{caps}|{digit})*			{ 
										yylval.name = yytext;
										return NAME;
										}

-?({digit}+|({digit}*\.{digit}+))			{
												yylval.dval = atof(yytext);
												return NUMBER;
											}

[-+=*/()]		{ return *yytext; }


[ \t]		;

\n	|
.		return yytext[0];




%%



int yywrap(){
	return 1;
}




