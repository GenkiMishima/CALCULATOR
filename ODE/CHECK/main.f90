program main
implicit none
integer i
double precision h,x,y,ans,true_value,error
double precision,parameter::epsilon=1d-3

i=0

x=0d0
y=0d0
h=1d-1
!do while(x<3d0)
open(42,file='out_true.d')
open(43,file='out_eu.d')
open(44,file='error_eu.d')
do i=1,100
   !i=i+1
   x=abs(i)*h
   call EU(x,y,h,ans)
   !true_value=-1d0/x
   !if(abs(y-ans)<epsilon)exit
   error=abs(ans-true_value)/true_value
   !print *,ans,true_value,error
   write(42,*)i,true_value
   write(43,*)i,ans
   write(44,*)i,error
   y=ans
end do
close(42)
close(43)
close(44)

i=0

x=0d0
y=0d0

open(43,file='out_rk4.d')
open(44,file='error_rk4.d')
do i=1,100
   !i=i+1
   x=abs(i)*h
   call RK4(x,y,h,ans)
   !true_value=-1d0/x
   !if(abs(y-ans)<epsilon)exit
   error=abs(ans-true_value)/true_value
   !print *,ans,true_value,error
   write(43,*)i,ans
   write(44,*)i,error
   y=ans
end do
close(43)
close(44)


end program main

subroutine EU(x,y,h,ans)
double precision,intent( in):: x,y,h
double precision,intent(out):: ans
   ans=y+h*f(x,y)
contains
double precision function f(x,y)
double precision x,y
f=1+y**2
end function f
end subroutine EU

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
f=1+y**2
end function f
end subroutine RK4
