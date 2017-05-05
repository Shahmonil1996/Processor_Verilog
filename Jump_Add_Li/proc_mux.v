`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:14:05 04/10/2017 
// Design Name: 
// Module Name:    proc_mux 
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
module proc_mux(
    input [7:0] input_a,
    input [7:0] input_b,
    input sel,
    output [7:0] out
    );

assign out = (sel) ? input_b : input_a;

endmodule
