subroutine RUNGEKUTTA2(ans_x,ans_y)
use global
implicit none
integer i,num
double precision,intent(out) :: ans_x,ans_y
!double precision,intent(inout) :: x0,y0,z0
double precision x,y,z,w
double precision k,k0,k1,k2,k3,l,l0,l1,l2,l3
x=x0
y=y0
z=z0
num=int(xmax/h)

do i=1,num
   k0=h*f(x,y,z)
   l0=h*g(x,y,z)
   k1=h*f(x+0.5d0*h,y+0.5d0*k0,z+0.5d0*l0)
   l1=h*g(x+0.5d0*h,y+0.5d0*k0,z+0.5d0*l0)
   k2=h*f(x+0.5d0*h,y+0.5d0*k1,z+0.5d0*l1)
   l2=h*g(x+0.5d0*h,y+0.5d0*k1,z+0.5d0*l1)
   k3=h*f(x+h,y+k2,z+l2)
   l3=h*g(x+h,y+k2,z+l2)
   k=(k0+2.d0*k1+2.d0*k2+k3)/6.d0
   l=(l0+2.d0*l1+2.d0*l2+l3)/6.d0
   x=x+h
   y=y+k
   z=z+l
enddo
ans_x=x
ans_y=y

contains
function f(x,y,z)
double precision f
double precision x,y,z
f=z
end function f
function g(x,y,z)
double precision g
double precision x,y,z
g=3d0*z-2d0*y
end function g

end subroutine RUNGEKUTTA2
