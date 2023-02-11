CC=gcc
CLIB=.
HEADERS=.
CFLAG=-std=gnu89 -Wall -Wextra -pedantic $(foreach D,$(HEADERS), -I$(D))

CFILES=$(foreach D,$(CLIB),$(wildcard $(D)/*.c))
OBJECT=$(patsubst %.c,%.o,$(CFILES))
BIN=shell

all: build/$(BIN)

build/$(BIN): $(OBJECT)
	$(CC) $(^) -o $(@)

%.o: %.c
	$(CC)  $(CFLAG) -c $(^) -o $(@)

.PHONY: run
run:
	build/$(BIN)

.PHONY: clean
clean:
	rm $(OBJECT) build/$(BIN)

.PHONY: betty
betty:
	betty $(CFILES)
