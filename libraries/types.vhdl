package types is 
   type u1 is range 0 to 1;
   type u2 is range 0 to 3;
   type u3 is range 0 to 7;
   type u4 is range 0 to 15;
   type u5 is range 0 to 31;
   type u6 is range 0 to 64;
   type u7 is range 0 to 127;
   type u8 is range 0 to 255;
   type i8 is range -128 to 127;
   type u12 is range 0 to 4095;
   type i12 is range -2048 to 2047;
   type u16 is range 0 to 65535;
   type i16 is range -32768 to 32767;
   type u24 is range 0 to 16777215;
   type u32 is range 0 to 4294967296;
   type i32 is range -2147483648 to 2147483647;
   type u64 is range 0 to 18446744073709551616;
   type i64 is range -9223372036854775808 to 9223372036854775807;

   type unused_bits is array(natural <range>) of u1;
end types;