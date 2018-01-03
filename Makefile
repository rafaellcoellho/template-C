all: objfolder tests runnable

objfolder: 
	@ mkdir -p build 

analysis:
	make -f MakeAnalysis.mk V=${V} all

runnable:
	make -f MakeRunnable.mk V=${V} all

tests: 
	make -f MakeTests.mk V=${V} all

clean:
	make -f MakeRunnable.mk V=${V} clean
	make -f MakeTests.mk V=${V} clean
	@ rm -rf ./build/objs/ ./build/lib/ 
