subroutine cuerpo()
use bloke
implicit none

open(54,file='mask.grid',form='unformatted')
    read(54)mask
close(54)

return
end subroutine 
