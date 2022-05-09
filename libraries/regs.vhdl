library types;
use types.all;


package regs is
    type flags is record 
          carry: boolean;
          zero: boolean;
          overflow: boolean;
          negative: boolean;
          parity: boolean;
    end flags;

    type mode is record
        ucode_val: u2;
        xm: boolean;
    end mode;

    function mode_to_r19(md : mode) return u64 is
    begin
        variable mode : u64 := 0;
        mode(32) := to_u1(md.xm);
        mode(33) := to_u1(md.xm);
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
        pg: boolean;
        ie: boolean;
        fp: boolean;
        fpexcept: boolean;
        vec: boolean;
        rand: boolean;
        rpollinfo: boolean;
        ptl: u3;
    end cr0;
    
    type round is (ToInf, ToMInf, ToZero, HalfUp, HalfToEven);

    type except_field is record
        invalid: boolean;
        divbyzero: boolean;
        overflow: boolean;
        underflow: boolean;
        inexact: boolean;
        fsignal: boolean;
    end;

    type fpcw is record
        rnd: round;
        denorm: boolean;
        except: except_field;
        emask: except_field;
        emaskall: boolean;
        xops: u2;
    end fpwcw;

    type rdfault is (UNAVAIL, RESET, FAULT, PAUSE);

    type rdinfo is record
            entropy: u16;
            fault: rdfault;
            repeat: boolean;
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

    type vecpair is record
        low: u64;
        high: u64;
    end vecpair;

    type page_addr is u52;

    type page is record
        npe: page_addr;
    end page;

    type sccr is record
        fc: u1;
    end sccr;
    
    type all_regs is record
        general: array(0 to 15) of u64;
        ip: u64;
        flags: flags;
        mode: mode;
        fpcw: fpwcw;
        float: array(0 to 7) of u64;
        vec: array(0 to 15) of vecpair;
        cr0: cr0;
        cr1: page;
        scdp: u64;
        scsp: u64;
        sccr: sccr;
        itabp: u64;
        cpuid: u128;
        cpuex2: cpuex2;
    end all_regs;

end regs;