# .c files
C_SOURCE=$(wildcard ./src/*.c)

# Command used at clean target
RM = rm -rf

#
## Static analysis of the files
#

cppcheck: folder 

folder: $(C_SOURCE)
	@ echo 'Running static analysis with cppcheck in the project...'
	@ echo ' '
	cppcheck .
	@ echo ' '
	@ echo 'Finished'


checkpatch: sources

sources: $(C_SOURCE) 
	@ echo 'Running checkpatch in source and header files...'
	./scripts/checkpatch.pl --no-tree -f ./src/*.c ./inc/*.h 
	@ echo 'Finished'
	@ echo ' '

all: tests
	@ mkdir -p build 

runnable:
	make -f MakeRunnable.mk V=${V} all

tests: 
	make -f MakeTests.mk V=${V} all

clean:
	make -f MakeRunnable.mk V=${V} clean
	make -f MakeTests.mk V=${V} clean
	@ $(RM) ./build/objs/ ./build/lib/ 
