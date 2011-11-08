DEFS     = '-DMSG="Hello world!\n"'
CFLAGS   = $(DEFS) -std=c99 -Wall -pedantic
CXXFLAGS = $(DEFS) -Weffc++ -Wall -pedantic
LDFLAGS  = -s

SRCS = $(wildcard *.c *.cpp)
OBJS = $(patsubst %.c,%.o,$(patsubst %.cpp,%.o,$(SRCS)))
BIN  = main

.PHONY: all clean

all: $(BIN)

$(BIN): $(OBJS)

depend: $(SRCS)
	$(CC) -MM -MP $^ > $@

clean:
	rm -f $(BIN) *.o depend

-include depend
