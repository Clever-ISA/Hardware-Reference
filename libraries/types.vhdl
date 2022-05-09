library ieee.numeric_std;

use ieee.numeric_std.all;

package types is 



   type u1 is   unsigned(range 0 to 0);
   type u2 is   unsigned(range 0 to 1);
   type u3 is   unsigned(range 0 to 2);
   type u4 is   unsigned(range 0 to 3);
   type i4 is   signed  (range 0 to 3);
   type u5 is   unsigned(range 0 to 4);
   type u6 is   unsigned(range 0 to 5);
   type u7 is   unsigned(range 0 to 6);
   type u8 is   unsigned(range 0 to 7);
   type i8 is   signed  (range 0 to 7);
   type u9 is   unsigned(range 0 to 8);
   type u10 is  unsigned(range 0 to 9);
   type u11 is  unsigned(range 0 to 10);
   type u12 is  unsigned(range 0 to 11);
   type i12 is  signed  (range 0 to 11);
   type u16 is  unsigned(range 0 to 15);
   type i16 is  signed  (range 0 to 15);
   type u24 is  unsigned(range 0 to 23);
   type u32 is  unsigned(range 0 to 31);
   type i32 is  signed  (range 0 to 31);
   type u48 is  unsigned(range 0 to 47);
   type u52 is  unsigned(range 0 to 51);
   type u64 is  unsigned(range 0 to 63);
   type i64 is  signed  (range 0 to 63);
   type u128 is unsigned(range 0 to 127);
   type i128 is signed  (range 0 to 127);


   type half is u16;
   type single is u32;
   type double is u64;
   type quad is u128;

   function to_u1(val: boolean) is
   begin
      case val is
         when true => return ('1');
         when false => return ('0');
      end case;
   end to_u1;

end types;