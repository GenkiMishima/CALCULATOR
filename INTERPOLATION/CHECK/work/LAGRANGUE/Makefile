compiler=ifort -xHOST -O3 -static -parallel -openmp

all: a.out
prmtr.o: prmtr.f90
	 $(compiler) -c $<
a.out: main.f90 prmtr.o
	 $(compiler) $^
clean:remove
	rm -rf *.mod a.out *.o *.d
remove:
