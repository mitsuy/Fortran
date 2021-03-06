!
! Calculation of 'pi' by Gauss-Legendre method.
!
! Set initial values　as follows:
! a0=1, b0=1/sqrt(2),t0=1/4,p0=1
!
! and solve as below equations;
! .....
!
! Written by M.Yagyu, 2 Jan, 2019
!


program gauss_legendre

  implicit none

  integer :: n=0,loop
  real(8) :: a0,b0,t0,p0
  real(8) :: a_new,b_new,t_new,p_new
  real(8) :: pi=0
  

  ! Initial values
  a0=1.
  b0=1./sqrt(2.)
  t0=1./4
  p0=1.
  

  ! Loop times number
  loop=100

  do n=1,loop
     a_new=(a0+b0)/2
     b_new=sqrt(a0*b0)
     t_new=t0-p0*(a0-a_new)**2
     p_new=2*p0

     ! Update values
     a0=a_new
     b0=b_new
     t0=t_new
     p0=p_new
  end do

  pi=(a_new+b_new)**2/(4*t_new)
  write(*,*)'pi=',pi

end program gauss_legendre
