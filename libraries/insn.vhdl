library types;
use types.all;

package insn is 
   type instruction is record
       opcode: u12;
       h: u4;
   end instruction;

   type operand_kind is (DIRECT, INDIRECT,SHORT,LONG);

   type operand is record
        kind: operand_kind;
        rest: u14;
   end operand;

   type cc is (Parity, Carry, Overflow, Zero, LessThan, LessEq, BelowEq, Minus, Plus, Above, Greater, GreaterEq, NonZero,NoOverflow, NoCarry, NoParity);

   type branch_instruction is record
        ss: u2;
        rel: u1;
        cc: cc;
        weight: i4;
   end branch_instruction;

   
end insn;
