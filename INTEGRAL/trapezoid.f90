subroutine trapezoid(ans)
use integ_prmtr
implicit none
integer i,j
double precision temp0,temp1
double precision ans,h

h=(Maxi-Mini)/dble(N)
do i=1,N-1
temp1=h*i
temp0=temp0+f(temp1)
end do
ans=h*((f(dble(h*0))+f(dble(h*N)))/2d0+temp0)
end subroutine trapezoid
