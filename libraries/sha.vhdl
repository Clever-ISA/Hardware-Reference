library types;
use types.all;

package sha is
    type sha32_state is array(0 to 7) of u32;

    type sha64_state is array(0 to 7) of u64;

    function sha32_sigma ( w: array(0 to 63) of u32, i: range 16 to 63) return u32 is
        variable s0: u32;
        variable s1: u32;
    begin
        s0 := (w(i-15) ror 7) xor (w(i-15) ror 18) xor (w(i-15) srl 3);
        s1 := (w(i-2) ror 17) xor (w(i-2) ror 19) xor (w(i-2) srl 10);
        return w(i-16) + s0 + w(i-7) + s1;
    end function sha32_sigma;

    function sha32_round ( w: u32, k: u32, variable h: sha32_state) return_type sha32_state is
        variable S0: u32;
        variable S1: u32;
        variable ch: u32;
        variable maj: u32;
        variable temp1: u32;
        variable temp2: u32;
    begin
        S1 := (h(4) ror 6) xor (h(4) ror 11) xor (h(4) ror 25);
        ch := (h(4) and h(5)) xor ((not h(4)) and h(6));
        temp1 := h(7) + S1 + ch + k + w;
        S0 := (h(0) ror 2) xor (h(0) ror 13) xor (h(0) ror 22);
        maj := (h(0) and h(1)) xor (h(0) and h(2)) xor (h(1) and h(2));
        temp2 := S0 + maj;

        h(7) := h(6);
        h(6) := h(5);
        h(5) := h(4);
        h(4) := h(3) + temp1;
        h(3) := h(2);
        h(2) := h(1);
        h(1) := h(0);
        h(0) := temp1 + temp2;
        return h;
    end function sha32_round;


    procedure sha32_block ( inp: array(0 to 15) of u32, variable h: inout sha32_state, signal clk: Boolean) is
        variable w: array(0 to 63) of u32;
        variable inner: sha32_state;
        constant K: array(0 to 63) of u32 := (0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
        0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
        0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
        0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
        0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
        0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
        0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
        0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2);
    begin
        for i in range 0 to 15 loop
            w(i) := inp(i);
        end loop;
        for i in range 16 to 63 loop
            w(i) := sha32_sigma(w, i);
        end loop;
        inner := h;
        for i in range 0 to 63 loop
            inner := sha32_round(w(i), K(i), inner);
        end loop;
        for i in range 0 to 7 loop
            h(i) := h(i) + inner(i);
        end loop;
        return h;
    end function sha32_block;

    function sha32_prepare_block(inp: array(natural <bitlen>) of bit) return array(natural<>) of array(16) of u32 is
        variable len: u64;
    begin

    end function sha32_prepare_block;
end sha;