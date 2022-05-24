%{
#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
#include<string.h>
FILE *yyin;
%}
/*SECCION DE OPCIONES/
/*Esto indicaaFlex que lea sólo un fichero de entrada*/
%option noyywrap
/*Nos permite obtener el numero de linea"/
%option yylineno
/*SECCION TOKENS*/
DIGITO              [0-9]
LETRA               [a-zA-Z]
ESPACIO             [ \t\n\r\f\v]
INICIO_COMENTARIO   ["/*"]
FIN_COMENTARIO      ["*/"]
GUIONES             [-_]
CHAR_COMA           [","]
CHAR_PUNTO          ["."]
CHAR_PUNTOYCOMA     [";"]
CHAR_DOSPUNTOS      [":"]

IDENTIFICADOR   {LETRA}({LETRA}|{DIGITO}|{GUIONES})*
CONST_INTEGER   (-?[1-9][0-9]{0,4})|0
CONST_FLOAT     (DIGITO)(0,8){CHAR_PUNTO}{DIGITO}(1,8)
CONST_CADENA    \"[^\n"]*\"

/*Operadores lógicos y operadores aritméticos básicos*/

OP_SUMA         ["+"]
OP_RESTA        ["-"]
OP_MULT         ["*"]
OP_DIV          ["/"]
OP_IGUAL        ["="]
OP_MAYOR        [">"]
OP_MENOR        ["<"]
OP_MAYORIGUAL   ">="
OP_MENORIGUAL   "<="
OP_COMP_IGUAL   "=="
OP_NEGACION     "!"
OP_DISTINTO     "!="
OP_MULTIGUAL    "*="
OP_ARIT         ["%"]
OP_DOSPUNTOS    [":"]

FIN_SENTENCIA   [";"]

/*Palabras reservadas*/
IF           "IF"|"if"
ELSE         "ELSE"|"else"
WHILE        "WHILE"|"while"
FOR          "FOR"|"for"
INTEGER      "INTEGER"|"Integer"|"int"
FLOAT        "FLOAT"|"Float"|"float"
PRINT        "PRINT"|"print"

%%

{OP_ARIT}                {printf("\nOP_ARITMETICO (s%)", yytext);}
{OP_DOSPUNTOS}           {printf("\nOP_DOSPUNTOS (s%)", yytext);}
{FIN_SENTENCIA}          {printf("\nFIN_SENTENCIA (s%)", yytext);}
{CHAR_COMA}              {printf("\nCHAR_COMA (s%)", yytext);}
{CHAR_PUNTOYCOMA}        {printf("\nCHAR_PUNTOYCOMA (s%)", yytext);}
{CONST_INTEGER}          {fn_verificarRango(yytext); printf("\nCONST_INTEGER (s%)", yytext);}
{CONST_FLOAT}            {printf("\nCONST_FLOAT (s%)", yytext);}
{CONST_CADENA}           {printf("\nCONST_CADENA (s%)", yytext);}
{OP_SUMA}                {printf("\nOP_SUMA (s%)", yytext);}
{OP_RESTA}               {printf("\nOP_RESTA (s%)", yytext);}
{OP_MULT}                {printf("\nOP_MULT (s%)", yytext);}
{OP_DIV}                 {printf("\nOP_DIV (s%)", yytext);}
{OP_IGUAL}               {printf("\nOP_IGUAL (s%)", yytext);}
{OP_MAYOR}               {printf("\nOP_MAYOR (s%)", yytext);}
{OP_MENOR}               {printf("\nOP_MENOR (s%)", yytext);}
{OP_MAYORIGUAL}          {printf("\nOP_MAYORIGUAL (s%)", yytext);}
{OP_MENORIGUAL}          {printf("\nOP_MENORIGUAL (s%)", yytext);}
{OP_COMP_IGUAL}          {printf("\nOP_COMP_IGUAL (s%)", yytext);}
{OP_MULTIGUAL}           {printf("\nOP_MULTIGUAL (s%)", yytext);}
{OP_NEGACION}            {printf("\nOP_NEGACION (s%)", yytext);}
{OP_DISTINTO}            {printf("\nOP_DISTINTO (s%)", yytext);}
{OP_DOSPUNTOS}           {printf("\nOP_DOSPUNTOS (s%)", yytext);}
{FOR}                    {printf("\nPalabra Reservada FOR (s%)", yytext);}
{PRINT}                  {printf("\nPalabra Reservada PRINT(s%)", yytext);}
{IF}                     {printf("\nPalabra Reservada IF:(%s)",yytext);}
{WHILE}                  {printf("\nPalabra Reservada WHILE:(%s)",yytext);}
{INTEGER}                {printf("\nPalabra Reservada INTEGER:(%s)",yytext);}
{FLOAT}                  {printf("\nPalabra Reservada FLOAT:(%s)",yytext);}
{IDENTIFICADOR}          {printf("\nIDENTIFICADOR:(%s)",yytext);}
. yyerror();
%%

int main(int argc,char*argv[]){

    if((yyin=fopen(argv[1],"rt"))==NULL){
         printf("\nNo se puede abrir el archivo:%s\n",argv[1]);
         return 1;
    }
    else{
         printf("\nEl archivo %s se abrio correctamente\n",argv[1]);
         yylex();
    }
    printf("\nFLEX Finalizo la lectura del archivo%s\n", argv[1]);
    fclose(yyin);
    return 0;
}


int fn_verificarRango(char*ptr)
    {
        int value = atoi(ptr);
        if (value< -32768 || value >32767)
        {
         printf("Error:variable fuera de rango:%s",yytext);
         return yyerror();
        }
    return  0;
    }

int yyerror(void){
    printf("\nError lexico:Caracter invalido: %s ,saliendo ...\n",yytext);
    exit(1);
}
