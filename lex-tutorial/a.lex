%{
#include <stdio.h>
%}

%%
0* { printf("Word: %s\n", yytext); }
.  { /* ignore other characters */ }
%%

int yywrap(){
    return 1;
}

int main() {
        yylex();
            return 0;
}

