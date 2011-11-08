#DEFS     =
#CFLAGS   =
#CXXFLAGS =
#LDFLAGS  =

SRCS = $(wildcard *.c *.cpp)
OBJS = $(patsubst %.c,%.o,$(patsubst %.cpp,%.o,$(SRCS)))
BIN  = main

$(BIN): $(OBJS)

depend: $(SRCS)
	$(CC) -MM -MP $^ > $@

.PHONY: clean
clean:
	rm -f $(BIN) *.o depend

-include depend
