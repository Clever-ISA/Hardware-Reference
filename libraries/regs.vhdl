library types;
use types.all;

library std.vhd;
use std.vhd.Boolean;

package regs is
    type flags is record 
          carry: Boolean;
          zero: Boolean;
          overflow: Boolean;
          negative: Boolean;
          parity: Boolean;
          unused5: unused_bits(12 downto 0);
          fpen: Boolean;
          unused18: u1;
          xm: Boolean;
          unused20: unused_bits(43 downto 0);
    end flags;
end regs;