library types;
use types.all;

package insn is 
   type instruction is record
       opcode: u12;
       h: u4;
   end instruction;

   type operand is record
        kind: u2;
        rest: u14;
   end operand;

   type cc is (Parity, Carry, Overflow, Zero, LessThan, LessEq, BelowEq, Minus, Plus, Above, Greater, GreaterEq, NonZero,NoOverflow, NoCarry, NoParity);

   
end insn;
