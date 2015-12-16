#compiler=ifort -check -traceback
compiler=ifort -xHOST -O3 -static -parallel
#compiler=gfortran

all: a.out

prmtr.o: prmtr.f90
	$(compiler) -c $<
#LU.o: LU.f90 prmtr.o
#	$(compiler) -c $<
a.out: main.f90 prmtr.o# LU.o
	$(compiler) $^
clean:remove
	rm -rf *.mod a.out *.o data/*.d *.d *.bin
remove:
