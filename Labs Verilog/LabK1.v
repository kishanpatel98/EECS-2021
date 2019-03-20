module LabK1;
reg [31:0] x;

initial
begin
	$display($time, " ", x);
	x = 0;
end
endmodule
