#!/usr/bin
cd work/LINEAR
ifort main.f90
./a.out
cd ../..

cd work/LAGRANGUE
make clean
make
./a.out
cd ../..

python test.py



