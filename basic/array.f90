!
! How to initilaize array with Fortran90/95
! 
! Written by M.Yagyu
!
! Note that it dinamically reserves memories in this code.
!

program test_array

  integer,allocatable,dimension(:) :: array
  integer :: n=10,i,j

  allocate(array(2*n))


  do i=1,n
     array(i)=1
  end do
  do j=n+1,2*n
     array(j)=2
  end do
  i=0
  do i=1,2*n
     write(*,*)array(i)
  end do
end program test_array
