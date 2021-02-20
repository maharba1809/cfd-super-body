       
       real,  allocatable, dimension (:,:,:) :: u,v,w,p,t,x,y,z
       integer i_sample,n_serie
       integer n1,n2,n3,nd
       integer nx,ny,nz,i,j,k,l
      character(2) serie
      character(3) sample
      character(12) outputfield


       nx=50
       ny=45
       nz=109
       allocate(u(nx,ny,nz))
       allocate(v(nx,ny,nz))
       allocate(w(nx,ny,nz))
       allocate(t(nx,ny,nz))
       allocate(p(nx,ny,nz))
       allocate(x(nx,ny,nz))
       allocate(y(nx,ny,nz))
       allocate(z(nx,ny,nz))

      open(11,file='channel.grid',form='unformatted')
      read(11)nd
      read(11)n1,n2,n3
      read(11)x
      read(11)y
      read(11)z
      close(11)

        OPEN(61,FILE='dataplt5.dat',FORM='formatted')

       n_serie=2
       i_sample=81
       do l=1,20
       WRITE(sample,'(i3.3)')i_sample
       WRITE(serie,'(i2.2)')n_serie
       outputfield='field_'//serie//'.'//sample
       OPEN(11,file=outputfield,form='unformatted')
       READ(11)nd
       READ(11)n1,n2,n3
       READ(11)u
       READ(11)v
       READ(11)w
       READ(11)t
       READ(11)p
       i_sample=i_sample+1

        write(61,*)'VARIABLES = "X", "Y", "Z", "U",  "P", "W"'  
        write(61,*)'ZONE I=',NX,' J=',NY,' K=',NZ,' DATAPACKING=POINT'
        DO k=1,nz
        DO j=1,ny
        DO i=1,nx
         Write(61,100)x(i,j,k),y(i,j,k),z(i,j,k),u(i,j,k),  &
           p(i,j,k),w(i,j,k)
        enddo
        enddo
        enddo

 100   FORMAT(e12.4,e12.4,e12.4,e12.4,e12.4,e12.4)
       CLOSE(11)
       enddo
       CLOSE(61)
       end
