BIN = coredump
OBJ = types.cmo parser.cmo main.cmo
LIB = -I +camlp5
LNK = camlp5.cma

all: $(BIN)

$(BIN): $(OBJ)
	ocamlc $(LIB) -o $@ $(LNK) $(OBJ)

parser.ml: parser.ml5
	camlp5o pr_o.cmo -impl $^ -o $@

%.cmo: %.ml
	ocamlc $(LIB) -c $<

clean:
	rm -fr parser.ml *.cm[io]

.PHONY: all clean

# -- Module dependencies --

parser.cmo: types.cmo
main.cmo: parser.cmo
