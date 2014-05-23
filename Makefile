.PHONY: all conflicts clean

all: main.byte

main.byte: lex.mll ast.ml main.ml gram_2008_5_6.mly
	ocamlbuild -use-menhir -use-ocamlfind -tag debug \
	-package sexplib.syntax -syntax camlp4o main.byte

conflicts:
	menhir --explain gram_2008_5_6.mly

clean:
	ocamlbuild -clean
