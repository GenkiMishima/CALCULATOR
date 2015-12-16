program main
use integ_prmtr
implicit none
double precision ans

call trapezoid(ans)
print *,'trapezoid',ans
call simpson13(ans)
print *,'simpson13',ans

end program main
