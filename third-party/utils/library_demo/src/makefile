TARGET_Linux = libtest1.linux
TARGET_Mac = libtest1.mac
TARGET_shared = true

ifeq ($(OS),Windows_NT)
    ARCH := Windows
else
    ARCH := $(shell uname -s)
endif

ifeq ($(ARCH), Linux)
    target = $(TARGET_Linux)
	readSymbol = strings $(target) | grep GLIBC
endif
ifeq ($(ARCH), Darwin)
    target = $(TARGET_Mac)
endif

ifeq ($(TARGET_shared), true)
	CC_CFLAGS = -shared
else
	CC_CFLAGS = 
endif

all: $(target)
	@echo "----------------- nm ---------------------"
	nm $(target)
	@echo "------------------------------------------"
	@echo "---------------- GLIBC -------------------"
	$(readSymbol)
	@echo "------------------------------------------"
	cp $(target) ../

$(target): test1.o
	gcc $^ $(CC_CFLAGS) -o $@

clean:
	rm $(target) *.o