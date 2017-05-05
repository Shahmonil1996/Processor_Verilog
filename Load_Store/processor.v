`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:48:45 04/21/2017 
// Design Name: 
// Module Name:    processor 
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
module processor(
    input clk,
    input reset
    );
wire [7:0] ins_code , read_data , write_data , imm_sign_extend;
wire reg_write , mem_read , mem_write;
assign imm_sign_extend = {{5{ins_code[2]}},ins_code[2:0]};
ins_fetch IF(clk , reset , ins_code);
reg_file RF(clk , reset , reg_write , ins_code[5:3] , write_data , read_data);
control CO( ins_code[7:6] , reg_write , mem_read , mem_write);
data_mem DM(clk ,reset , mem_read , mem_write , imm_sign_extend , read_data , write_data);
endmodule
