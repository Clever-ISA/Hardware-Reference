library types;
use types.all;

package paging is

    type npe_perm is (EMPTY,PRESENT);

    type npe is record
        perm: npe_perm;
        xm: u1;
        sxp: u1;
        ossu: u3;
        npaddr: u52;
    end npe;

    type lpe_perm is (EMPTY, READ, WRITE, EXEC);

    type lpe is record
        perm: lpe_perm;
        xm: u1;
        sxp: u1;
        ossu: u3;
        paddr: u52;
    end lpe;

    

end paging;
