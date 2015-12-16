all: a.out

integ_prmtr.o: integ_prmtr.f90
	ifort -c $<
trapezoid.o: trapezoid.f90 integ_prmtr.o
	ifort -c $<
simpson13.o: simpson13.f90 integ_prmtr.o
	ifort -c $<
a.out: main.f90 integ_prmtr.o trapezoid.o simpson13.o
	ifort $^
clean:remove
	rm -rf *.o a.out
remove:
