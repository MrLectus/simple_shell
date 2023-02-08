CC=gcc
CLIB=.
HEADERS=.
CFLAG=-std=gnu89 -Wall -Wextra -pedantic $(foreach D,$(HEADERS), -I$(D))

CFILES=$(foreach D,$(CLIB),$(wildcard $(D)/*.c))
OBJECT=$(patsubst %.c,%.o,$(CFILES))
BIN=$(foreach D,build,$(D)/shell)

all: $(BIN)

$(BIN): $(OBJECT)
	$(CC) $(^) -o $(@)

%.o: %.c
	$(CC)  $(CFLAG) -c $(^) -o $(@)

.PHONY: run
run:
	./$(BIN)

.PHONY: clean
clean:
	rm $(OBJECT) $(BIN)

.PHONY: betty
betty:
	betty $(CFILES)
