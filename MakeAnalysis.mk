# .c files
C_SOURCE=$(wildcard ./src/*.c)

all: folder sources

folder: $(C_SOURCE)
	@ echo 'Running static analysis with cppcheck in the project...'
	@ echo ' '
	cppcheck ./src/
	@ echo ' '
	@ echo 'Finished'


sources: $(C_SOURCE)
	@ echo 'Running checkpatch in source and header files...'
	./scripts/checkpatch.pl --no-tree -f ./src/*.c ./src/*.h
	@ echo 'Finished'
	@ echo ' '
