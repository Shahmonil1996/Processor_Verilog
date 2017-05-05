`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:21:02 04/06/2017 
// Design Name: 
// Module Name:    exe 
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
module exe(
    input [7:0] alu_input_a,
    input [7:0] alu_input_b,
    input reset,
    output [7:0] alu_out
    );
	wire c_out;
	assign {c_out,alu_out}  = alu_input_a + alu_input_b;
endmodule
