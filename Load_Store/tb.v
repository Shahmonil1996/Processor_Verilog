`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:51:44 04/21/2017
// Design Name:   processor
// Module Name:   D:/Sem 3-2/Comp Arch/MIPS/test1/tb.v
// Project Name:  test1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	processor uut (
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#50;
      reset = 0;
		#50 reset = 1;
clk =1;
#100;
reset = 1;
clk = 0;
#100;
      reset = 1;
clk =1;
#100;
reset = 1;
clk = 0;
#100;
      reset = 1;
clk =1;
#100;
reset = 1;
clk = 0;
#100;
repeat(4)
begin
      reset = 1;
clk =1;
#100;
reset = 1;
clk = 0;
#100;	
end	
		// Add stimulus here

	end
      
endmodule

