%option yylineno

digit           [0-9]
letter          [A-Z]
alphanumeric    ({letter}|{digit})
sign            [+-]
newline         \n
whitespace      [ \t\n]

%%

OR      return OR;
AND     return AND;
GT      return GT;
GE      return GE;
NE      return NE;
EQ      return EQ;
LT      return LT;
LE      return LE;

\+      return ADD;
\-      return SUBTRACT;
\*      return MULTIPLY;
\/      return DIVIDE;
\%      return MODULUS;
\:\=    return ASSIGN;

\(      return L_PAREN;
\)      return R_PAREN;
\{      return L_BRACK;
\}      return R_BRACK;
\,      return COMMA;
\.      return PERIOD;
\"      return QUOTE;
\;      return SEMICOLON;

PGM     return PGM;
RETURN  return RETURN;
WHILE   return WHILE;
FOR     return FOR;
IF      return IF;
ELSE    return ELSE;

INT     return T_INT;
REAL    return T_REAL;
STRING  return T_STRING;
VOID    return T_VOID;


{sign}{digit}+              return INT;
{sign}{digit}+\.{digit}+    return REAL;
{letter}+({letter}|{digit}) return STRING;

\n      {extern int lineno;
         lineno++;
         return NEW_LINE;
        }

{whitespace}                ;
.                           return ERROR;

%%

int yywrap(void){
    return 1;
}
