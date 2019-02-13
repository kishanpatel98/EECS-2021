module useMax;
reg signed [31:0] a, b;
wire signed [31:0] z;
integer flag;

max myMax(z, a, b);

initial
begin

	flag = $value$plusargs("a=%d", a);
	flag = $value$plusargs("b=%d", b);
	#1;
	$display("The max of %0d and %0d is %0d\n", a, b, z);

end
endmodule
