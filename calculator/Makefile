all : build

build :
	yacc -d calculator.y
	lex calculator.l
	gcc y.tab.c lex.yy.c -o calculator

run :
	./calculator

clean :
	rm *.tab.* | true
	rm lex.yy.c | true
	rm calculator | true
