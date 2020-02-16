
%{  /* Declarations */
    #include <stdio.h>
    #include <string.h>
%}



%%  /* Rules */



%%  /* Programs */
int main(){
    return yyparse();
}

void yyerror(){
    fprintf(stderr, "%s\n", s);
}
