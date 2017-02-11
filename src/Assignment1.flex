/*
Bobby Purcell
For CSC484
Jflex Assignment 1
Parses URLs, IPV4 addresses, and a basic username template from file input
*/
import java.io.*;
%%

%class Assignment1
%standalone
%line
%column
%unicode


/*
  Declarations
*/

%{
      public void PrintToken(String text,int line,int column, String type){
        System.out.println("Found " + type +" on line:" + yyline + " at column: " + yycolumn +"\n\t" + yytext());
      }
%}

/*
  Macros
*/
    URL = https?:\/\/([A-Za-z0-9\-\.]+\.[A-Za-z\.]{2,6})([\/+a-zA-Z0-9\ \_\.\-]*\/*|\/*)
    IPv4 = ((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)
    username = [a-z0-9\_\-]{8,16}
%%
/* ----------------Lexical Rules ------------- */


<YYINITIAL>[ \t\r\n]+  			         { /* ignore */ }
{URL}  {PrintToken(yytext(),yyline,yycolumn,"URL");}
{IPv4}  {PrintToken(yytext(),yyline,yycolumn,"Ip Address");}
{username} {PrintToken(yytext(),yyline,yycolumn,"Username");}
<YYINITIAL>[^]  {
                     System.out.println("No Match for "+yytext()+" on line:" +
                                                 yyline + " at column: " + yycolumn);
                   }
<<EOF>>         {System.exit(0);}
