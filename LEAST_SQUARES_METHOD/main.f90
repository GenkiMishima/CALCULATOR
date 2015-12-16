program main
implicit none
integer i,j,k
integer,parameter::NN=20
integer,parameter::dx=1d0
double precision temp(7),x,ans_y
double precision,dimension(NN,1:2)::raw_data
print *,'ok'
open(66,file='in.d')
read(66,*) j
!if(j.eq.NN) call exit(1)
do i=1,NN
read(66,*) raw_data(i,1),raw_data(i,2)
end do
close(66)
print '(2es15.7)',raw_data
temp=0d0
do i=1,NN
temp(1)=temp(1)+raw_data(i,1)*raw_data(i,2)
temp(2)=temp(2)+raw_data(i,1)
temp(3)=temp(3)+raw_data(i,2)
temp(4)=temp(4)+raw_data(i,1)*raw_data(i,1)
end do
print *,temp(1),temp(2)
print *,temp(3),temp(4)
temp(5)=(dble(NN)*temp(1)-temp(2)*temp(3))/(dble(NN)*temp(4)-temp(2)**2)
temp(6)=(temp(4)*temp(3)-temp(1)*temp(2))/(dble(NN)*temp(4)-temp(2)**2)
print *,temp(5),temp(6)
open(66,file='out.d')
do i=1,NN
x=dble(i)*dx
ans_y=temp(5)*x+temp(6)
write(66,*)x,ans_y
end do
close(66)

end program main
