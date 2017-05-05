`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:28:47 04/11/2017 
// Design Name: 
// Module Name:    exe_jump 
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
module exe_jump(
    input [7:0] a,
    input [7:0] b,
    output [7:0] c
    );
assign c = a+b;

endmodule
