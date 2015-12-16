subroutine LU
use prmtr
implicit none
integer i,j,m,o
double precision temp,e,f
double precision,dimension(1:n)::c,inv_l
double precision,dimension(1:n,1:n)::L,U
   L=0d0
   U=0d0
   do i=1,n
      l(i,1)=a(i,1)
      u(i,i)=1d0
   end do
   inv_l(1)=1d0/l(1,1)
   do i=2,n
      u(1,i)=a(1,i)*inv_l(1)
   end do
   do j=2,n
      do i=j,n
         e=0d0
         do m=1,j-1
            e=e+l(i,m)*u(m,j)
         end do
         l(i,j)=a(i,j)-e
      end do
      inv_l(j)=1d0/l(j,j)
      do i=j+1,n
         f=0d0
         do m=1,j-1
            f=f+l(j,m)*u(m,i)
         end do
         u(j,i)=(a(j,i)-f)*inv_l(j)
      end do
   end do
   
   c(1)=b(1)*inv_l(1)
   do j=2,n
      e=0d0
      do i=1,j-1
         e=e+l(j,i)*c(i)
      end do
      c(j)=(b(j)-e)*inv_l(j)
   end do
   
   x(n)=c(n)
   do j=1,n-1
      m=n-j
      e=0d0
      do i=0,m+1
      !do i=1,m
         o=n-i
         if(o<=0)exit
         e=e+u(m,o)*x(o)
      end do
      x(m)=(c(m)-e)
   end do

end subroutine LU
