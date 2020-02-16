calc: lex.yy.c y.tab.c
	gcc -g lex.yy.c y.tab.c -o simple

lex.yy.c: y.tab.c simple.l
	lex simple.l

y.tab.c: simple.y
	yacc -d simple.y

clean: 
	rm -rf lex.yy.c y.tab.c y.tab.h simple simple.dSYM
