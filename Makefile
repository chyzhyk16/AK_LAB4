BIN_NAME = hello
OBJFILES = main.o factorial.o hello.o
CMAKEFILES = CMakeCache.txt cmake_install.cmake Makefile
CMAKEDIR = CMakeFiles
CXX = g++
DEPS = functions.a

CXXFLAGS = -c -Wall

SRC_EXT = cpp
SRC_PATH = .
LIBS =
SHELL = /bin/bash

export CMD_PREFIX := @

all: $(BIN_NAME) $(DEPS)
	@echo "Making symlink: $(BIN_NAME) -> $<"

$(BIN_NAME): $(OBJFILES)
	$(CXX) $(OBJFILES) -o $(BIN_NAME)

main.o: main.cpp
	$(CXX) $(CXXFLAGS) main.cpp

factorial.o: factorial.cpp
	$(CXX) $(CXXFLAGS) factorial.cpp

hello.o: hello.cpp
	$(CXX) $(CXXFLAGS) hello.cpp

$(DEPS): $(OBJFILES)
	ar rcs $(DEPS) $(OBJFILES)

clean:
	@echo "Deleting $(BIN_NAME) $(OBJFILES) $(DEPS) symlink"
	@$(RM) $(BIN_NAME)
	@$(RM) $(OBJFILES)
	@$(RM) $(DEPS)
	@echo "Deleting directories"
	@$(RM) -r build
	@$(RM) -r bin
	@echo "Deleting CMake $(CMAKEFILES) $(CMAKEDIR)"
	@$(RM) $(CMAKEFILES)
	@$(RM) -r $(CMAKEDIR)
