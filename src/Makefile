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
ifeq ($(suffix $(SRCS)), ".c")
	$(CC) $(LDFLAGS) -o $@ $^
else
	$(CXX) $(LDFLAGS) -o $@ $^
endif

depend: $(SRCS)
ifeq ($(suffix $(SRCS)), ".c")
	$(CC) -MM -MP $^ > $@
else
	$(CXX) -MM -MP $^ > $@
endif

clean:
	rm -f $(BIN) *.o depend

-include depend
