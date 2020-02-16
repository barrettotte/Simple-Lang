

%{  /* Definitions */
    #include <stdio.h>
    #include "y.tab.h"
%}



%%  /* Rules */



%%  /* Subroutines */

int yywrap(){
    return 1;
}
