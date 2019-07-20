module mod_diff

  use iso_fortran_env, only: int32, real32
  implicit none

  private
  public :: diffu, diffc

contains

  pure function diffc(x) result(dx)
    ! Returns a 2nd order centered difference of a 1-d array,
    ! with periodic boundary condition.
    real(real32), intent(in) :: x(:)
    real(real32) :: dx(size(x))
    integer(int32) :: im
    im = size(x)
    dx(1) = x(2) - x(im)
    dx(im) = x(1) - x(im-1)
    dx(2:im-1) = x(3:im) - x(1:im-1)
    dx = 0.5 * dx
  end function diffc


  pure function diffu(x) result(dx)
    ! Returns a 1st-order upstream finite difference of a 1-d array,
    ! with periodic boundary condition.
    real(real32), intent(in) :: x(:)
    real(real32) :: dx(size(x))
    integer(int32) :: im
    im = size(x)
    dx(1) = x(1) - x(im)
    dx(2:im) = x(2:im) - x(1:im-1)
  end function diffu

end module mod_diff
