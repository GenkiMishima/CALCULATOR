module prmtr
implicit none
integer,parameter::NN=9
integer,parameter::MM=9
double precision,parameter::ans_x=0.43d0
end module prmtr
program main
use prmtr
implicit none
integer i,j,k
double precision ans_y,p1,p2
double precision temp,temp1,temp2
double precision,dimension(1:NN)::x,y
integer,dimension(1:MM)::p
ans_y=0d0
!READ_DATA
open(44,file="input.d")
read(44,*) temp
if(temp.ne.NN) then
   print *,"INPUT_ERROR"
   call exit(1)
end if
do i=1,NN
   read(44,*) x(i),y(i)
end do 
close(44)
if(ans_x<x(1).or.ans_x>x(NN))then
   print *,"Not Found During This Data"
   call exit(1)
end if
do i=1,NN
   if (x(i)>ans_x)then
      do j=1,MM
         k=i-j-1
         p(j)=i-k
      end do
      exit
   end if
end do
do i=p(1),p(MM)
   temp1=1d0
   temp2=1d0
   do j=p(1),p(MM)
      if(i.eq.j)cycle
      temp1=temp1*(ans_x-x(j))
      temp2=temp2*(x(i)-x(j))
   end do
   ans_y=ans_y+y(i)*temp1/temp2
end do
open(44,file='output.d')
   write(44,*) ans_x,ans_y
close(44)

end program main
