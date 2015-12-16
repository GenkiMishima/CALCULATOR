program main
implicit none
integer i
double precision h,x,y,ans,true_value,error
double precision,parameter::epsilon=1d-3

i=0

x=0d0
y=1d0
h=5d-2
!do while(x<3d0)
open(42,file='out_true.d')
open(43,file='out_eu.d')
open(44,file='error_eu.d')
do i=1,100
   !i=i+1
   x=abs(i)*h
   call EU(x,y,h,ans)
   true_value=exp(-x)
   !if(abs(y-ans)<epsilon)exit
   error=abs(ans-true_value)/ans
   !print *,ans,true_value,error
   write(42,*)i,true_value
   write(43,*)i,ans
   write(44,*)i,error
   y=ans
end do
close(42)
close(43)
close(44)
!   print *,y,true_value


end program main

subroutine EU(x,y,h,ans)
double precision,intent( in):: x,y,h
double precision,intent(out):: ans
   ans=y+h*f(x,y)
contains
double precision function f(x,y)
double precision x,y
f=-y
end function f
end subroutine EU
