%{

#include <stdio.h>
int integerCnt = 0;
    int opCnt = 0;
    int parenCnt = 0;
    int eqCnt = 0;


%}

DIGIT [0-9]
ALPHA [a-zA-Z]
PLUS [+]
MINUS [-]
MULT [*]
DIV  [/]
L_PAREN [(]
R_PAREN [)]
EQUAL [=]
%%

{DIGIT}+ {printf("NUMBER: %s\n", yytext);integerCnt++;}
{PLUS}   {printf("PLUS: %s\n", yytext);opCnt++;}
{MINUS}  {printf("MINUS: %s\n", yytext);opCnt++;}
{MULT}   {printf("MULT: %s\n", yytext);opCnt++;}
{DIV}   {printf("DIV: %s\n", yytext);opCnt++;}
{L_PAREN}   {printf("L_PAREN: %s\n", yytext);parenCnt++;}
{R_PAREN}   {printf("R_PAREN: %s\n", yytext);parenCnt++;}
{EQUAL}   {printf("EQUAL: %s\n", yytext);eqCnt++;}
{ALPHA}+ {printf("NUMBER: %s\n", yytext);}
.	 {}

%%

main(void) {
    printf("Cntrl-D to exit\n");
        yylex();
    printf("# of integers: %d\n", integerCnt);
    printf("# of operators: %d\n", opCnt);
    printf("# of parentheses: %d\n", parenCnt);
    printf("# of equal signs: %d\n", eqCnt);
}


