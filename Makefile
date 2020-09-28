
DIR_BIN := bin
DIR_SRC := src

BINS := $(foreach p,$(wildcard ${DIR_SRC}/*.c),${DIR_BIN}/$(notdir ${p:.c=}))

FLAGS := -Wall -pedantic -g

all: ${BINS}

${DIR_BIN}/% : ${DIR_SRC}/%.c | ${DIR_BIN}
	gcc $^ -o $@ ${FLAGS}

${DIR_BIN} :
	mkdir $@
