module max(z, a, b);
output [31:0] z;
input[31:0] a, b;
wire [31:0] w;
wire zero, select;
wire[2:0] op;

assign op = 3'b111;
yAlu myAlu(w, zero, a, b, op);
assign select = w[0];
yMux #(32) myMux(z, a, b, select);

endmodule
