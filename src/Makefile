DEFS     = '-DMSG="Hello world!\n"'
INCS     =
LIBS     =
CFLAGS   = $(DEFS) $(INCS) $(LIBS) -std=c99 -Wall -pedantic
CXXFLAGS = $(DEFS) $(INCS) $(LIBS) -Weffc++ -Wall -pedantic
LDFLAGS  = -s

SRCS = $(wildcard *.c *.cc *.cpp *.cxx)
EXT  = $(firstword $(suffix $(SRCS)))
OBJS = $(SRCS:$(EXT)=.o)
BIN  = main

PREFIX=/usr/local

ifeq ($(EXT), .c)
LANG = C
else
LANG = CXX
endif

.PHONY: all install uninstall clean

all: $(BIN)

$(BIN): $(OBJS)
ifeq ($(LANG), C)
	$(CC) $(LDFLAGS) -o $@ $^
else
	$(CXX) $(LDFLAGS) -o $@ $^
endif

depend: $(SRCS)
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
#-include $(SRCS:$(EXT)=.d)
