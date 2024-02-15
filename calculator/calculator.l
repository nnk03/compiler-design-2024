%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<math.h>
#include "y.tab.h"
void yyerror(char *);
extern struct SymbolTable *symlook(char *name);


%}
digit [0-9]

%%

[A-Za-z][A-Za-z0-9]*		{ yylval.ptr = symlook(yytext);return VARIABLE;}

-?({digit}+)|({digit}*\.{digit}+)            { yylval.dval = atof(yytext); return NUMBER; }

[-+=()*/]     { return *yytext; }

[ \t]   ;

\n  |
.       return yytext[0];




%%

int yywrap(){
    return 1;
}
