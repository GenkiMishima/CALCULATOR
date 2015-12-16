module integ_prmtr
implicit none
integer,parameter :: N=10000
double precision,parameter :: Mini=0d0
double precision,parameter :: Maxi= 1d2
contains
double precision function f(x)
double precision,intent(in )::x
f=4d0/(1d0+x**2)
end function f
end module integ_prmtr
