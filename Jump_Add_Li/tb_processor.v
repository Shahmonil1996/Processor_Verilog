`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: BITS Pilani Hyderabad Campus
// Engineer: MONIL SHAH
// 
// Create Date:    09:38:49 04/06/2017 
// Design Name: 
// Module Name:    reg_file 
// Project Name: 	Computer Architecture Assignment 2
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

module tb_processor;
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
		clk = 0;	reset = 0; #100;
		clk =1; reset = 1; #100;

	repeat(8)
	begin
		clk =0; 		reset = 0; 		#100;
		clk =1; 		reset = 0; 		#100;
	end
		// Add stimulus here
	end
endmodule

