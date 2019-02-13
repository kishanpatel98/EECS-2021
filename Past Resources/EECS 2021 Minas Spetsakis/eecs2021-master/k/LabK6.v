module labK;

   reg a, b, c;
   wire notOutput, lowerInput;
   wire firstAndOut, firstAndIn;
   wire secondAndOut, secondAndIn;

   not (notOutput, c);
   and (firstAndOut, a, lowerInput);
   and (secondAndOut, c, b);
   or (z, firstAndIn, secondAndIn);
   assign lowerInput = notOutput;
   assign firstAndIn = firstAndOut;
   assign secondAndIn = secondAndOut;

   initial
     begin
        a = 1;
        b = 0;
        c = 0;

        #1; // wait for z
        $display("a=%b b=%b c=%b z=%b", a, b, c, z);
        $finish;
     end

endmodule
