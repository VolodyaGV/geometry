
all: build bin bin/main

clean:

	-rm -f bin/main build/*.o

bin/main: build/main.o build/geometry.o

	gcc -Wall -Wextra build/main.o build/geometry.o -o bin/main -lm

build/main.o: src/main.c

	gcc -Wall -Wextra -c src/main.c -o build/main.o

build/geometry.o: src/geometry.c

	gcc -Wall -Wextra -c src/geometry.c -o build/geometry.o

bin:
	mkdir bin
build:
	mkdir build
.PHONY: clean
