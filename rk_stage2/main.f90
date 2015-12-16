program main
use global
implicit none
double precision ans_x,ans_y

call RUNGEKUTTA2(ans_x,ans_y)

print *,ans_x,ans_y

end program main
