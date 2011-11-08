DEFS     = '-DMSG="Hello world!\n"'
CFLAGS   = $(DEFS) -std=c99 -Wall -pedantic
CXXFLAGS = $(DEFS) -Weffc++ -Wall -pedantic
LDFLAGS  = -s

SRC = $(wildcard *.c *.cpp)
OBJ = $(patsubst %.c,%.o,$(patsubst %.cpp,%.o,$(SRC)))
BIN = main

ifeq ($(firstword $(suffix $(SRC))), .c)
LANG = C
else
LANG = CXX
endif

.PHONY: all clean

all: $(BIN)

$(BIN): $(OBJ)
ifeq ($(LANG), C)
	$(CC) $(LDFLAGS) -o $@ $^
else
	$(CXX) $(LDFLAGS) -o $@ $^
endif

depend: $(SRC)
ifeq ($(LANG), C)
	$(CC) -MM -MP $^ > $@
else
	$(CXX) -MM -MP $^ > $@
endif

clean:
	rm -f $(BIN) *.o depend

-include depend
