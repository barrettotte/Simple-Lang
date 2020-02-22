%token OR AND NE EQ LT LE GT GE 
%token L_PAREN R_PAREN L_BRACK R_BRACK 
%token COMMA PERIOD SEMICOLON QUOTE
%token ADD SUBTRACT MULTIPLY DIVIDE MODULUS ASSIGN
%token FOR WHILE IF ELSE
%token T_INT T_REAL T_STRING T_VOID 
%token INT REAL STRING 
%token RETURN NEW_LINE ERROR PGM

%start pgm

%%

func_types  : T_INT | T_REAL T_STRING T_VOID
            ;

types       : INT | REAL | STRING
            ;

operators   : EQ | NE | LT | LE | GT | GE
            ;

nothing     :
            ;

pgm         : PGM L_PAREN args R_PAREN block
            ;

block       : L_BRACK statements R_BRACK

statements  : statements SEMICOLON statement
            | statements NEW_LINE
            | statement SEMICOLON
            ;

statement   : while
            | for
            | if_else
            | func_dec 
            | func_call 
            | var_dec 
            | var_assign
            | return
            ;

while       : WHILE L_PAREN expression operators expression R_PAREN block
            ;

for         : FOR L_PAREN var_assign SEMICOLON expression operators expression SEMICOLON R_PAREN block
            ;

if_else     : IF L_PAREN expression operators expression R_PAREN block
            | IF L_PAREN expression operators expression R_PAREN block ELSE block
            ;

expression  : expression SUBTRACT term
            | expression ADD term
            | expression OR term
            | term
            | func_call
            | STRING
            ;

term        : term MULTIPLY factor
            | term DIVIDE factor
            | term MODULUS factor
            | term AND factor
            | factor
            ;

factor      : L_PAREN expression R_PAREN
            ;

func_dec    : func_types STRING L_PAREN func_parms R_PAREN block
            ;

func_parms  : STRING
            | func_parms COMMA STRING
            | nothing
            ;

return      : RETURN expression
            ;

func_call   : STRING L_PAREN args R_PAREN
            ;

args        : expression
            | args COMMA expression
            | nothing
            ;

var_dec     : types STRING ASSIGN expression
            ;

var_assign  : STRING ASSIGN expression
            ;

%%
#include "lex.yy.c"

int lineno;

int main(void){
    return yyparse();
}

int yyerror(char *s){
    fprintf(stderr, "%s in line: %d\n", s, lineno);
}
