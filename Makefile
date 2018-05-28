.PHONY: all clean install getenv parsetree source rewriter

all: clean getenv source

clean:
	rm -rf _build/ *.cmo *.cmi *.native a.out

install:
	@echo make install is not implemented

getenv:
	ocamlbuild -package compiler-libs.common ppx_getenv01.native

source:
	ocamlc -dsource -ppx ./ppx_getenv01.native foo.ml

rewriter:
	ocamlfind ppx_tools/rewriter ./ppx_getenv01.native foo.ml

parsetree:
	ocamlc -dparsetree foo.ml
