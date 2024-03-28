`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:12:43 10/16/2015 
// Design Name: 
// Module Name:    S2_Register 
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
module S2_Register(
	input clk,
	input rst,
	input [31:0] RD1,
	input [31:0] RD2,
	input [4:0] WS,
	input [5:0]ALUOP,
	input [31:0] Imm,
	input WE, DS,
	output reg [31:0] RD1EX,
	output reg [31:0] RD2EX,
	output reg [31:0] ImmEX,
    output reg DSEX,
    output reg [5:0]ALUEX,
	output reg [4:0] WSP,
	output reg WEP
   );

	always@(posedge clk)
		begin
		if (rst)
			begin
			RD1EX	<= 32'd0;
			RD2EX	<= 32'd0;
			ImmEX <= 0;
			DSEX <= 0;
			ALUEX <=0;
			WSP <= 5'd0;
			WEP <= 1'b0;
			end
		else
			begin
            RD1EX <= RD1;
            RD2EX <= RD2;
            ImmEX <= Imm;
            DSEX <= DS;
            ALUEX  <= ALUOP;
            WSP <= WS;
            WEP <= WE;
			end
		end

endmodule

