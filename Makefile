all: build/src build/test bin bin/main bin/testing

clean:

	-rm -f bin/main build/src/*.o
	-rm -f bin/testing build/test/*.o

bin/main: build/src/main.o build/src/geometry.o build/src/parser.o

	gcc -Wall -Werror build/src/main.o build/src/geometry.o build/src/parser.o -o bin/main -lm

build/src/main.o: src/main.c

	gcc -Wall -Werror -c src/main.c -o build/src/main.o

build/src/geometry.o: src/geometry.c

	gcc -Wall -Werror -c src/geometry.c -o build/src/geometry.o

build/src/parser.o: src/parser.c

	gcc -Wall -Werror -c src/parser.c -o build/src/parser.o



bin/testing: build/test/main.o build/test/geometry_test.o build/test/parser_test.o build/src/geometry.o build/src/parser.o

		gcc build/test/main.o build/test/geometry_test.o build/test/parser_test.o build/src/geometry.o build/src/parser.o -o bin/testing -lm -std=c11

build/test/main.o: test/main.c

		gcc -I thirdparty -c test/main.c -o build/test/main.o

build/test/geometry_test.o: test/geometry_test.c

		gcc -I thirdparty -c test/geometry_test.c -o build/test/geometry_test.o

build/test/parser_test.o: test/parser_test.c

		gcc -I thirdparty -c test/parser_test.c -o build/test/parser_test.o

bin:
	mkdir bin
build/src:
	mkdir -p build/src
build/test:
	mkdir -p build/test
.PHONY: clean
