compiler=ifort -check -traceback

all: main

prmtr.o: prmtr.f90
	$(compiler) -c $<
runge_kutta2.o: runge_kutta2.f90 prmtr.o
	$(compiler) -c $<
main: main.f90 prmtr.o runge_kutta2.o
	$(compiler) $^
clean:remove
	rm -rf *.mod a.out *.o
remove:
