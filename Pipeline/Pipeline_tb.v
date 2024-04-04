`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:34:40 10/16/2015
// Design Name:   Pipeline
// Module Name:   C:/Users/Ethan/Desktop/Pre_Lab6/Pre_Lab6/Pipeline_tb.v
// Project Name:  Pre_Lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pipeline_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] InstrIn;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	Pipeline uut (
		.clk(clk), 
		.rst(rst), 
		.InstrIn(InstrIn), 
		.Out(Out)
	);

	// Define clk
	always #5 assign clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		InstrIn = 0;

		// Wait 10 ns for global reset to finish
		#10;
		rst = 0;
		InstrIn = 32'b000000_11111_00001_00000_00000000000;
		//set r2 = r1, output 10
		
		#30;
		InstrIn = 32'b000001_11110_00001_00000_00000000000;   
		//r30 = ~r1, output should be FFFFFFF5
		
		#30;
		InstrIn = 32'b000011_00011_00001_00010_00000000000;			
		//r3 = r1+ r2 output should be 30
		
		#30;
		InstrIn = 32'b001011_00100_00010_0000000000010100;				
		//r2= r2 + 20 output should be 40
		
		#30;
		InstrIn = 32'b000100_11101_00010_00011_00000000000;	
		//r29 = ~(r2|r3)		
		
		#30;
		InstrIn = 32'b000110_00010_00101_00011_00000000000;			
		//r2 = r5-r3
		
		#30;
		InstrIn = 32'b001110_00100_01000_0000000000101000;			
        // r4 = r8 - 40
        
		#30;
		InstrIn = 32'b000101_11111_00010_00100_00000000000;
		//r31= ~(r2&r4)   All F
		
		#30;
		InstrIn = 32'b000010_00000_00010_00100_00000000000;
		//r0 = r2&r4
		
		#30;
		InstrIn = 32'b000111_00001_00010_00100_00000000000;
		//r1 = (r2 < r4) ? 1 : 0
		
		
		#50; 
		$finish;

	end
      
endmodule

