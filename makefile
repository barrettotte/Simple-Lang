simple: y.tab.c
	gcc -o simple y.tab.c

y.tab.c: simple.y lex.yy.c
	yacc -d simple.y

lex.yy.c: simple.l
	lex simple.l

clean: 
	rm -rf lex.yy.c y.tab.c y.tab.h simple simple.dSYM
