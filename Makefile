all: tests run

run:
	./main

bin:
	make -f MakeBin.mk all

install_cpputest:
	if [ -d /cpputest-3.8 ]; then rm -rf cpputest-3.8 ; fi
	if [ -f /cpputest-3.8.tar.gz ]; then rm -rf cpputest-3.8.tar.gz; fi
	wget https://github.com/cpputest/cpputest/releases/download/v3.8/cpputest-3.8.tar.gz
	tar -xf cpputest-3.8.tar.gz
	rm cpputest-3.8.tar.gz
	mv cpputest-3.8 cpputest
	cd cpputest; ./autogen.sh; ./configure; make all
	
tests:
	make -f MakeTests.mk all

tests_coverage:
	make -f MakeTests.mk coverage

clean:
	make -f MakeBin.mk clean
	make -f MakeTests.mk clean
	make -f MakeTests.mk coverage_clean
	@ rm -rf ./build/objs/ ./build/lib/
