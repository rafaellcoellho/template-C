all: folder

folder: $(C_SOURCE)
	@ echo 'Running static analysis with cppcheck in the project...'
	@ echo ' '
	cppcheck ./src/
	@ echo ' '
	@ echo 'Finished'
