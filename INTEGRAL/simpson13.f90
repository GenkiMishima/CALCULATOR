subroutine simpson13(ans)
use integ_prmtr
implicit none
integer i,j
double precision temp0,temp1,temp2
double precision ans,ans1,ans2,h

h=(Maxi-Mini)/dble(N)
!h=abs(Maxi-0d0)/dble(N)
temp0=0d0
do i=1,N-1,2
temp1=h*i
temp0=temp0+f(temp1)
end do
do i=2,N-1,2
temp1=h*i
temp2=temp2+f(temp1)
end do
ans=h/3d0*(f(dble(h*0))+f(dble(h*N))+4d0*temp0+2d0*temp2)

!h=abs(Mini-0d0)/dble(N)
!temp0=0d0
!do i=1,N-1,2
!temp1=h*i
!temp0=temp0+f(temp1)
!end do
!do i=2,N-1,2
!temp1=h*i
!temp2=temp2+f(temp1)
!end do
!ans2=h/3d0*(f(dble(h*0))+f(dble(h*N))+4d0*temp0+2d0*temp2)
!ans=ans1+ans2
end subroutine simpson13
