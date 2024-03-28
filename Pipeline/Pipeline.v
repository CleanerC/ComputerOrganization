`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:19:01 10/16/2015 
// Design Name: 
// Module Name:    Pipeline 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Pipeline(
	input clk,
	input rst,
	input [31:0] InstrIn,
	output [31:0] Out
   );

	
	// Wires for increment
	wire [4:0] S1_R2, S1_R3, S1_WS;
	wire [31:0] S1_Imm;
	wire [5:0] S1_ALUOP;
	wire S1_WE, S1_DS; 
	
    wire [31:0] FIN;

	wire [4:0] S3_WS;
	wire S3_WE;

	S1_Register S1_Reg(
		.clk(clk),
		.rst(rst),
		.InstrIn(InstrIn),
		.RS1(S1_R2),
		.RS2(S1_R3),
		.WS(S1_WS),
		.Imm(S1_Imm),
		.WE(S1_WE),
		.DS(S1_DS),
		.ALUOP(S1_ALUOP)
   );

	wire [31:0] read_data_2, read_data_1;

	nbit_register_file Register_File (
		.write_data(FIN),
		.read_sel_1(S1_R2),
		.read_sel_2(S1_R3),
		.read_data_1(read_data_1),
		.read_data_2(read_data_2),
		.clk(clk),
		.write_address(S3_WS),
		.RegWrite(S3_WE)
	);
		
	wire [31:0] RD1EX, RD2EX;
	wire [31:0] ImmEX;
	wire [5:0] ALUEX;
	wire DSEX, S2_WE;
	wire [4:0] S2_WS;
	
	S2_Register S2_Reg(
		.clk(clk),
		.rst(rst),
		.RD1(read_data_1),
		.RD2(read_data_2),
		.WS(S1_WS),
		.ALUOP(S1_ALUOP),
		.Imm(S1_Imm),
		.WE(S1_WE),
		.DS(S1_DS),
		.RD1EX(RD1EX),
		.RD2EX(RD2EX),
		.ImmEX(ImmEX),
		.DSEX(DSEX),
		.ALUEX(ALUEX),
		.WSP(S2_WS),
		.WEP(S2_WE)
   	);

	wire [31:0] ALU_R3;

	MUX MUX (
		.R(RD2EX),
		.I(ImmEX),
		.Se(DSEX),
		.out(ALU_R3)
	);

	wire [31:0] ALURES;

	ALU ALU(
		.R2(RD1EX),
		.R3(ALU_R3),
		.opcode(ALUEX),
		.ALUOUT(ALURES)
	);


   	S3_REG S3_Reg(
	.clk(clk),
	.rst(rst),
	.WE(S2_WE),
	.WS(S2_WS),
	.ALUOUT(ALURES),
	.RESU(FIN),
	.WSP(S3_WS),
	.WEP(S3_WE)
   );

   assign Out = FIN;

endmodule
