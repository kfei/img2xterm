PREFIX = /usr/local
INSTALL = install
LN = ln -fs

ifeq ($(shell sh -c 'which gcc>/dev/null 2>/dev/null && echo y'), y)
	CC = gcc
	CFLAGS = -O2 -Wall
	LDFLAGS = -s
endif

ifeq ($(shell sh -c 'uname'), Darwin)
	CC = clang
	CFLAGS = -O2 -Wall
	LDFLAGS =
endif

ifeq ($(shell sh -c 'which ncurses5-config>/dev/null 2>/dev/null && echo y'), y)
	DEFS =
	CFLAGS += $(shell ncurses5-config --cflags)
	LIBS = -lm $(shell ncurses5-config --libs)
else
	ifeq ($(shell sh -c 'which ncursesw5-config>/dev/null 2>/dev/null && echo y'), y)
		DEFS =
		CFLAGS += $(shell ncursesw5-config --cflags)
		LIBS = -lm $(shell ncursesw5-config --libs)
	else
		DEFS = -DNO_CURSES
		LIBS = -lm
	endif
endif

ifeq ($(shell sh -c 'which MagickWand-config>/dev/null 2>/dev/null && echo y'), y)
	WANDCONFIG = MagickWand-config
else
	WANDCONFIG = Wand-config
endif

CFLAGS := $(CFLAGS) $(shell $(WANDCONFIG) --cflags)
CPPFLAGS := $(CPPFLAGS) $(DEFS) $(shell $(WANDCONFIG) --cppflags)
LDFLAGS := $(LDFLAGS) $(shell $(WANDCONFIG) --ldflags)
LIBS := $(LIBS) $(shell $(WANDCONFIG) --libs)

all: img2xterm

img2xterm: img2xterm.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $< $(LDFLAGS) $(LIBS)

.PHONY: all install clean

clean:
	-$(RM) img2xterm
