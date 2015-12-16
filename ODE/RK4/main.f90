program main
implicit none

integer i,j
double precision h,x,y,ans,true_value,error
double precision,parameter:: epsilon=1d-3

i=0

x=0d0
y=1d0
h=5d-2

!open(44,file='out_eu.d')
open(44,file='error_rk4.d')
do i=1,100
   !i=i+1
   x=abs(i)*h
   call RK4(x,y,h,ans)
   true_value=exp(-x)
   !if(abs(y-ans)<epsilon)exit
   error=abs(ans-true_value)/ans
   !print *,ans,true_value,error
   write(44,*)ans,true_value,error
   write(44,*)i,error
   y=ans
end do
close(44)
   !print *,y,true_value

end program main
subroutine RK4(x,y,h,ans)
implicit none
double precision k1,k2,k3,k4
double precision,intent( in):: x,y,h
double precision,intent(out):: ans

!x_n = x+h

k1  = f(x        ,y           )
k2  = f(x+0.5d0*h,y+0.5d0*h*k1)
k3  = f(x+0.5d0*h,y+0.5d0*h*k2)
k4  = f(x+      h,y+      h*k3)
ans = y+h/6d0*(k1+2d0*k2+2d0*k3+k4)


contains
double precision function f(x,y)
double precision x,y
f=-y
end function f

end subroutine RK4
