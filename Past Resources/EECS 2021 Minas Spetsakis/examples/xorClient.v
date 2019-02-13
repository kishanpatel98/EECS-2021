module client;
wire z;
reg a, b;
integer flag, i;

myXor test(z, a, b);

initial
begin
	//a = 1;
	//b = 0;

	flag = $value$plusargs("a=%b", a);
	flag = $value$plusargs("b=%b", b);
	for (i = 0; i < 40; i = i + 1)
	begin
		a = $random;
		b = $random;
		#1;
		$display("a=%b, b=%b --> z=%b", a, b , z);
	end
	$finish;
end

endmodule

