{
  open Lexing
  open Gram_2008_5_6

  exception SyntaxError of string
}


let int = '-'? ['0'-'9'] ['0'-'9']*
let id = ['a'-'z' 'A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*

rule read = parse
| int  { INT (int_of_string (Lexing.lexeme lexbuf)) }
| id   { ID (Lexing.lexeme lexbuf) }
| '('  { LPAREN }
| ')'  { RPAREN }
| '+'  { PLUS }
| '/'  { DIV }
| '^'  { CARET }
| '\n' { read lexbuf }
| ' '  { read lexbuf }
| eof  { EOF }
| _    { raise (SyntaxError ("Unexpected lexeme: " ^ Lexing.lexeme lexbuf)) }
