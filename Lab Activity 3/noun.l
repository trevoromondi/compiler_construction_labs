%{
/*
 * this is a implementation of simple  noun recognition:
 * a noun/not a noun.
 */
int count = 0;
/*
 * the count variable is used to count the number of nouns
 */
%}
 
/*** Rule Section has a set of nouns that will be used***/
%%
[\t ]+                   /* ignore whitespace */ ;

time |
person |
year |
way |
day |
thing |
man |
world |
life |
hand |
part |
child |
eye |
woman |
place |
work |
week |
case |
point |
government { printf("%s: is a noun\n", yytext); count++;}
[a-zA-Z]+ { printf("%s: is not a noun\n", yytext); }

.|\n      {return 0;}
%%

int yywrap(){}
int main(){
 
// Explanation:
// yywrap() - wraps the above rule section
/* yyin - takes the file pointer
          which contains the input*/
/* yylex() - this is the main flex function
          which runs the Rule Section*/
// yytext is the text in the buffer
 

FILE *fp;
char noun[50];
printf("Enter the sentence: \n");
scanf("%s", noun);
fp = fopen(noun,"r");
yyin = fp;
 
yylex();
printf("\nNumber of Nouns "
      "in the given input - %d\n", count);
 
return 0;
}