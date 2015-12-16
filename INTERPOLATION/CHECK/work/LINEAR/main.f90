program main
implicit none
integer,parameter::N=9
integer i,j,ii
double precision ans_x,ans_y,p1,p2
double precision temp
double precision,dimension(1:N)::x,y
!READ_DATA
open(44,file="../INPUT/input.d")
read(44,*) temp
if(temp.ne.N) then
   print *,"INPUT_ERROR"
   call exit(1)
end if
do i=1,N
   read(44,*) x(i),y(i)
end do 
close(44)

open(44,file="../OUTPUT/linear_output.d")
!LINEAR_INTERPOLATION{{{
do ii=1,7
   ans_y=0d0
   ans_x=0.05d0+dble(ii)*0.1d0
   if(ans_x<x(1).or.ans_x>x(N))then
      print *,"Not Found During This Data"
      call exit(1)
   end if
   do i=1,N
      if (x(i)>ans_x)then
         p1=i-1
         p2=i  
         exit
      end if
   end do
   ans_y=y(p1)+(y(p2)-y(p1))/(x(p2)-x(p1))*(ans_x-x(p1))
   write(44,*),ans_x,ans_y
end do
!}}}
close(44)



end program main
