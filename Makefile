all: build/src build/test bin bin/main

clean:

	-rm -f bin/main build/src/*.o
	-rm -f bin/main build/test/*.o

bin/main: build/src/main.o build/src/geometry.o

	gcc -Wall -Werror build/src/main.o build/src/geometry.o -o bin/main -lm

build/src/main.o: src/main.c

	gcc -Wall -Werror -c src/main.c -o build/src/main.o

build/src/geometry.o: src/geometry.c

	gcc -Wall -Werror -c src/geometry.c -o build/src/geometry.o



bin/main: build/test/main.o build/test/geometry_test.o

		gcc -Wall -Werror build/test/main.o build/test/geometry_test.o -o bin/testing -lm

build/test/main.o: test/main.c

		gcc -Wall -Werror -c test/main.c -o build/test/main.o

build/test/geometry_test.o: test/geometry_test.c

		gcc -Wall -Werror -c test/geometry_test.c -o build/test/geometry_test.o

bin:
	mkdir bin
build/src:
	mkdir -p build/src
build/test:
	mkdir -p build/test
.PHONY: clean
