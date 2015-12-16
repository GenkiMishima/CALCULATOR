compiler=ifort -xHOST -O3 -static -parallel -openmp

all: a.out
a.out: main.f90
	 $(compiler) $^
clean:remove
	rm -rf *.mod a.out *.o
remove:
