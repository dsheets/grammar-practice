module Lexer = Lex
module Parser = Gram_2008_5_6

let lexbuf = Lexing.from_channel stdin
let ast = Parser.main (Lexer.read) lexbuf
let expr_str = Sexplib.Sexp.to_string (Ast.sexp_of_expr ast)

;;

print_endline expr_str
