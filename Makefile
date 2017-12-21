# Name of the project
PROJ_NAME=template

# .c files
C_SOURCE=$(wildcard ./src/*.c)

# .h files
H_SOURCE=$(wildcard ./header/*.h)

# Object files
OBJ=$(subst .c,.o,$(subst src,objs,$(C_SOURCE)))

# Compiler and linker
CC=gcc

# Flags for compiler
CC_FLAGS=-c         \
         -W         \
         -Wall      \
         -ansi      \
         -pedantic

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

#
## Checking files 
#

checkpatch: sources

sources: $(C_SOURCE) 
	@ echo 'Running checkpatch in source and header files...'
	./scripts/checkpatch.pl --no-tree -f ./src/*.c ./header/*.h 
	@ echo 'Finished'
	@ echo ' '

#
## Compilation and linking
#
all: objFolder $(PROJ_NAME)

$(PROJ_NAME): $(OBJ)
	@ echo 'Building binary using GCC linker: $@'
	$(CC) $^ -o $@
	@ echo 'Finished building binary: $@'
	@ echo ' '

./objs/%.o: ./src/%.c ./header/%.h
	@ echo 'Building target using GCC compiler: $<'
	$(CC) $< $(CC_FLAGS) -o $@
	@ echo ' '

./objs/main.o: ./src/main.c $(H_SOURCE)
	@ echo 'Building target using GCC compiler: $<'
	$(CC) $< $(CC_FLAGS) -o $@
	@ echo ' '

objFolder:
	@ mkdir -p objs 

clean:
	@ $(RM) ./objs/*.o $(PROJ_NAME) *~ 
	@ rmdir objs 

.PHONY: all clean
