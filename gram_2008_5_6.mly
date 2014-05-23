%token < int > INT
%token < string > ID
%token PLUS DIV CARET LPAREN RPAREN EOF

%start < Ast.expr > main

%{
  open Ast
%}

%%

main:
| e = expr EOF { e }

expr:
| i = INT { Int i }
| s = ID { Ident s }
| a = expr PLUS  b = expr { Add (a, b) }
| a = expr DIV   b = expr { Div (a, b) }
| a = expr CARET b = expr { Caret (a, b) }
| LPAREN e = expr RPAREN { e }
