DEFS     = '-DMSG="Hello world!\n"'
INCS     =
LIBS     =
CFLAGS   = $(DEFS) $(INCS) $(LIBS) -std=c99 -Wall -pedantic
CXXFLAGS = $(DEFS) $(INCS) $(LIBS) -Weffc++ -Wall -pedantic
LDFLAGS  = -s

SRC = $(wildcard *.c *.cpp)
OBJ = $(patsubst %.c,%.o,$(patsubst %.cpp,%.o,$(SRC)))
BIN = main

PREFIX=/usr/local

ifeq ($(firstword $(suffix $(SRC))), .c)
LANG = C
else
LANG = CXX
endif

.PHONY: all install uninstall clean

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

install: all
	install $(BIN) $(DESTDIR)$(PREFIX)/bin

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(BIN)

clean:
	rm -f $(BIN) *.o depend

-include depend
