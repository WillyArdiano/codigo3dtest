package com.mycompany.co3dtest;

import java_cup.runtime.*;
import static com.mycompany.co3dtest.ParserSym.*;
%%

%class Lexer
%unicode
%line
%column
%cup
%public

/*expresiones regulares*/
ESPECIAL = [ \t\r\n]+
NUMERO = [0-9]+
LETRAS = [a-zA-Z]+


%%

<YYINITIAL> {
	{NUMERO}                                { return new Symbol(NUMERO, yyline, yycolumn, yytext()); }
	{LETRAS}({LETRAS}|{NUMERO})*		{ return new Symbol(VARIABLE, yyline, yycolumn, yytext()); }
	"+"                                     { return new Symbol(SUMA, yyline, yycolumn, yytext()); }
	"-"                                     { return new Symbol(RESTA, yyline, yycolumn, yytext()); }
	"*"                                     { return new Symbol(MULTIPLICACION, yyline, yycolumn, yytext()); }
	"/"                                     { return new Symbol(DIVISION, yyline, yycolumn, yytext()); }
	"("                                     { return new Symbol(PAR_A, yyline, yycolumn, yytext()); }
	")"                                     { return new Symbol(PAR_C, yyline, yycolumn, yytext()); }
	"="                                     { return new Symbol(IGUAL, yyline, yycolumn, yytext()); }
	";"                                     { return new Symbol(PUNTO_Y_COMA, yyline, yycolumn, yytext()); }
}



//caracteres especiales
<YYINITIAL>{
	{ESPECIAL}	{	/* Ignorar */	}
}




