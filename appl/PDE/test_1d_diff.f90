!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
!
! 1D - thermal diffusion eq.
!
!  Boundary Condition : Dirichlet
!     f(0)=f(nx+nxb)=0
!
! Written by M.YAGYU 4 July 2019
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1

program the_diff

  implicit none

  integer :: i,n
  real(8) :: pi
  integer :: nt
  real(8) :: t,dt,time
  
  integer :: nx,nxb
  real(8) :: x,dx,Lx
  real(8) :: kappa

  
  real(8),allocatable,dimension(:) :: Temp

  pi=4*atan(1.)
  
  !! Initial params.
  nx=64
  Lx=1.0
  dx=Lx/nx
  nxb=1
  
  dt=0.01
  time=10.0
  nt=time/dt

  kappa=1.e-4
  
  allocate(Temp(nx+nxb))

  do i=0,nx+nxb
     write(*,*)Temp(i)
  end do

  open(10,file='1d_diff.dat',status='replace')
  
  do i =1,nx
     t=0.0
     x=i*dx
     Temp(i)=1-cos(2*pi*x/Lx)
     write(10,'(3f9.5)')t,(x-0.5*Lx),Temp(i)
  end do
  write(10,*)''

  
  !! Dirichlet
  Temp(0)=0.0
  Temp(nx+nxb)=0.0
  
  do i=1,nt
     t=i*dt
     x=0.
     do n=1,nx

        !x=(n-0.5)*dx
        x=n*dx
        !Temp(n)=Temp(n)+dt*kappa*(Temp(n+1)-2*Temp(n)-Temp(n-1))/(dx*dx)+1-cos(2*pi/Lx*x*x)
        Temp(n)=Temp(n)+dt*kappa*(Temp(n+1)-2*Temp(n)-Temp(n-1))/(dx*dx)

        write(*,'(3f9.5)')t,x,Temp(n)
        write(10,'(3f9.5)')t,(x-0.5*Lx),Temp(n)

     end do
     
     write(10,*)''
     
     !! Dirichlet
     Temp(0)=0.0
     Temp(nx+nxb)=0.0
  end do
  
  
end program the_diff
