library types;
use types.all;


package regs is
    type flags is record 
          carry: u1;
          zero: u1;
          overflow: u1;
          negative: u1;
          parity: u1;
          fpen: u1;
    end flags;

    type mode is record
        ucode_val: u2;
        xm: u1;
    end mode;

    function mode_to_r19(md : mode) return u64 is
    begin
        variable mode : u64 := 0;
        mode(32) := md.xm;
        mode(33) := md.xm;
        return mode;
    end mode_to_r19;

    function mode_to_mmode(md : mode) return u64 is
    begin
        variable mode : u64 := 0;
        mode(2 downto 0) := md.ucode_val;
        mode(32) := md.xm;
        mode(33) := md.xm;
        return mode;
    end mode_to_mmode;

    type cr0 is record
        pg: u1;
        ie: u1;
        fp: u1;
        fpexcept: u1;
        vec: u1;
        rand: u1;
        rpollinfo: u1;
        ptl: u3;
    end cr0;


    type rdfault is (UNAVAIL, RESET, FAULT, PAUSE);

    type rdinfo is record
            entropy: u16;
            fault: rdfault;
            repeat: u1;
    end rdinfo;

    type cpuex2 is record
        paddr_size: u3;
        vaddr_size: u3;
        fp: u1;
        fpext: u1;
        vec: u1;
        rand: u1;
        ndrand: u1;
    end cpuex2;

end regs;