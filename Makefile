
DIR_BIN := bin
DIR_SRC := src


BINS := $(foreach p,$(wildcard ${DIR_SRC}/*.c),${DIR_BIN}/$(notdir ${p:.c=}))
FLAGS := -Wall -pedantic -g


all: ${BINS}

# Additional dependencies for re-compilation.
${BINS}: Makefile


${DIR_BIN}/% : ${DIR_SRC}/%.c | ${DIR_BIN}
	gcc $(filter %.c %.h,$^) -o $@ ${FLAGS}


${DIR_BIN} :
	mkdir $@
