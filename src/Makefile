DEFS     = '-DMSG="Hello world!\n"'
INCS     =
LIBS     =
CFLAGS   = $(DEFS) $(INCS) $(LIBS) -std=c99 -Wall -pedantic
CXXFLAGS = $(DEFS) $(INCS) $(LIBS) -Weffc++ -Wall -pedantic
LDFLAGS  =

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

.PHONY: all debug strip install uninstall clean

all: $(BIN)

debug: CFLAGS   += -g
debug: CXXFLAGS += -g
debug: all

strip: all
	strip $(BIN)

$(BIN): $(OBJS)
ifeq ($(LANG), C)
	$(CC) $(LDFLAGS) -o $@ $^
else
	$(CXX) $(LDFLAGS) -o $@ $^
endif

%.d: %$(EXT)
ifeq ($(LANG), C)
	$(CC) -MM -MP -MT $$(echo $@ | sed s/.d/.o/) -MT $@ $< >$@
else
	$(CXX) -MM -MP -MT $$(echo $@ | sed s/.d/.o/) -MT $@ $< >$@
endif

install: all
	install $(BIN) $(DESTDIR)$(PREFIX)/bin

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(BIN)

clean:
	rm -f $(BIN) *.o *.d

-include $(SRCS:$(EXT)=.d)
