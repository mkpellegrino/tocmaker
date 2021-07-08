# 15 JUN 2020 - 07 15
# Be sure to change the name of the program here
FILE_NAME=tocmaker
CPPFLAGS=-arch x86_64 -m64
INCLUDE=-I/usr/local/include/c++/10.1.0/
XINCLUDE=-I/opt/X11/include
XLIBS=-L/opt/X11/lib/ -lX11
DEBUG=-g -DDEBUG
OPT=-O3

BIN_DIR=./
LIB_DIR=./
LST_DIR=./


release	: $(FILE_NAME).cpp Makefile
	$(value CXX) $(OPT) $(FILE_NAME).cpp $(CPPFLAGS) $(CXXFLAGS) $(INCLUDE) $(LDFLAGS) -o $(BIN_DIR)$(FILE_NAME)
	@echo "Done."

debug	: $(FILE_NAME).cpp Makefile
	$(value CXX) $(DEBUG) $(FILE_NAME).cpp $(CPPFLAGS) $(CXXFLAGS) $(INCLUDE) $(LDFLAGS) -o $(BIN_DIR)$(FILE_NAME)-debug
	@echo "Done."

all	: clean release debug

tidy:
	rm -fR $(LIB_DIR)*.o
	rm -f *~
	rm -f *.*~
	@echo "Tidied up a bit."

verbose: all
	@echo ""
	@echo "Filename: " $(value FILE_NAME)
	@echo "C++ Compiler (CXX): " $(value CXX) 
	@echo "C Compiler (CC): " $(value CC)
	@echo "C Preprocessor: " $(value CPP)
	@echo ""
	$(value CXX) --version
	@echo ""
	$(value CC) --version
	@echo ""
	@echo "Environment Variables:"
	@echo " BIN_DIR: " $(value BIN_DIR)
	@echo " LIB_DIR: " $(value LIB_DIR)
	@echo " INCLUDE: " $(value INCLUDE)
	@echo " LST_DIR: " $(value LST_DIR)
	@echo "     OPT: " $(value OPT)
	@echo "CXXFLAGS: " $(value CXXFLAGS)
	@echo "CPPFLAGS: " $(value CPPFLAGS)
	@echo " LDFLAGS: " $(value LDFLAGS)
	@echo "   DEBUG: " $(value DEBUG)
	@echo "XINCLUDE: " $(value XINCLUDE)
	@echo "   XLIBS: " $(value XLIBS)
	@echo ""

	make release
	make debug
	@echo "Build Completed"

clean:
	make tidy
	rm -fR $(BIN_DIR)$(FILE_NAME)
	rm -fR $(BIN_DIR)$(FILE_NAME)-debug
	rm -fR $(BIN_DIR)$(FILE_NAME)-debug.dSYM

help:
	@echo "Makefile - by: Michael K. Pellegrino"
	@echo "usage: make all|release|debug|clean|tidy|verbose"
	@echo ""
	@echo "Environment Variables:"
	@echo "CXX: use export CXX=/path/to/c++/compiler" 
	@echo "CC: use export CC=/path/to/c/compiler"
	@echo "CPP: use export CPP=/path/to/c++/preprocessor"
	@echo "BIN_DIR"
	@echo "LIB_DIR"
	@echo "INCLUDE"
	@echo "LST_DIR"
	@echo "OPT"
	@echo "CXXFLAGS"
	@echo "CPPFLAGS"
	@echo "LDFLAGS"
	@echo "DEBUG"
	@echo "XINCLUDE"
	@echo "XLIBS"
