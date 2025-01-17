module yPC(PCin, PCp4, INT, entryPoint, imm, jTarget, zero, branch, jump);
output [31:0] PCin;
input [31:0] PCp4, entryPoint, imm;
input [25:0] jTarget;
input INT, zero, branch, jump;
wire [31:0] immX4, bTarget, jTargetX4, choiceA, choiceB;
wire doBranch, zf;
assign immX4[31:2] = imm[29:0];
assign immX4[1:0] = 2'b00; 							
yAlu beqmaster(bTarget, zf, PCp4, immX4, 3'b010);				
and (doBranch, branch, zero); 							
yMux #(32) mux1(choiceA, PCp4, bTarget, doBranch);				
assign jTargetX4[31:28] = PCp4[31:28];
assign jTargetX4[27:2] = jTarget[25:0];
assign jTargetX4[1:0] = 2'b00;
yMux #(32) mux2(choiceB, choiceA, jTargetX4, jump);				
yMux #(32) mux3(PCin, choiceB, entryPoint, INT);				
endmodule
