library types;
use types.all;

library ieee;
use ieee.std_logic;

library ieee;
use ieee.std_logic

library regs;
use regs.all;

architecture clever is
    shared signal clk: std_logic;

    constant reg_init_state: all_regs = (
        ip => TO_UNSIGNED(0xff00),
        flags => (carry => false, zero => false, overflow => false, negative => false, parity => false),
        fpcw => (rnd => HalfToEven, 
            except => (invalid => false, divbyzero => false, overflow => false, underflow => false, inexact => false, fsignal => false),
            denorm => true,
            emask => (invalid => true, divbyzero => true, overflow => true, underflow => true, inexact => true, fsignal => true),
            emaskall => true,
            xopss => TO_UNSIGNED(2)
            ),
        rdinfo => (entropy => TO_UNSIGNED(0), fault => UNAVAIL, repeat => false),
        cr0 => (ptl => TO_UNSIGNED(0)),
        
    )

end clever;