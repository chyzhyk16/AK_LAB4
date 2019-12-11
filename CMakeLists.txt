cmake_minimum_required(VERSION 2.8)
project(my_favourite_project)

#set(SOURCE_EXE main.cpp hello.cpp factorial.cpp)
#set(SOURCE_LIB factorial.cpp hello.cpp)

add_library(functions STATIC factorial.cpp hello.cpp)
add_executable(hello main.cpp)

target_link_libraries(hello functions)
