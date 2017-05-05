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
module processor(
input clk,
input reset
);

	wire [7:0] ins_code ;
	reg [7:0] pc;
	wire F_rdst , F_rsrc; // Select lines for forwarding
	wire reg_dst,reg_write, pc_src, data_write;// control signals
	wire [7:0] data_1, data_2;
	wire [7:0] data_mux_alu_input,alu_out, alu_jump_addr, pc_next,alu_input_a , alu_input_b,exe_out ; 
	// wires used in the execute stage including mux , inputs of alu , output of alu
	
	reg [2:0] EX_rdst,ID_rdst,ID_rsrc; // EX and ID pipeline registers storing rdst and rsrc
	reg [2:0] imm , rsrc , rdst ; // registers used in decode stage
	reg [5:0] addr,ID_addr; // registers for address
	reg [7:0] imm_sign_extend, addr_sign_extend; // registers to store sign extended immediate and address
	reg [7:0] IF_pipeline, EX_data_out,ID_pc_next, ID_rsrc_data , ID_imm_data , ID_addr_data , ID_rdst_data; 
	// IF/ID Pipeline Register to pass decoded data from register file and immediate and address data
	
	reg ID_reg_write,ID_reg_dst,ID_PCSrc ,ID_data_write, EX_reg_write, EX_PCSrc, EX_reg_dst; 
	// ID/EX pipeline  Registers to store  control signals

initial pc = 8'b0;

	always@(posedge reset)
	begin
	//	 reset the complete processor on reset ie pc =0 and other registers including pipleine as XXXX
			pc = 8'b0;
	 imm =2'bX;
	 rsrc =2'bX;
	 rdst=2'bX;
	 addr=5'bX;
	 imm_sign_extend=8'bX;
	 addr_sign_extend=8'bX;

	 IF_pipeline=8'bX;
	 
	 ID_pc_next=8'bX;
	 ID_rsrc_data=8'bX;
	 ID_imm_data=8'bX;
	 ID_addr_data=8'bX;
	 ID_rdst_data=8'bX;
	 ID_reg_write=1'bX;
	 ID_reg_dst=1'bX;
	 ID_PCSrc =1'bX;
	 ID_addr=5'bX;
	 ID_rdst=2'bX;

	 EX_reg_write=1'bX;
	 EX_PCSrc=1'bX;
	 EX_reg_dst=1'bX;
	 EX_data_out=8'bX;
	 EX_rdst=2'bX;

	end	
	
	always@(posedge ID_PCSrc)
	begin
		// Flush pipeline registers to be stalled ie IF
		pc <= ID_pc_next;
		IF_pipeline = 8'bX;
	end
	
	ins_fetch f1(pc,reset,ins_code); // Fetch Instruction
	proc_control p1(IF_pipeline,clk ,reg_write,reg_dst,pc_src,data_write); // generate control signals
	reg_file r1(rdst,rsrc,EX_rdst,EX_data_out,reset,EX_reg_write, data_1,data_2); // get data from regfile and write data
	proc_mux p2( ID_imm_data ,alu_input_b , ID_reg_dst , data_mux_alu_input); // mux to select imm or rsrc data 
	exe e1(alu_input_a,data_mux_alu_input ,reset ,alu_out); // exe unit to calculate result
	exe_jump e2(pc, addr_sign_extend , alu_jump_addr);	// exe unit to calculate address
	proc_mux p3(pc, alu_jump_addr , pc_src , pc_next); // mux to select pc of next ins or jumped ins
	forward f2(EX_rdst,ID_rdst , ID_rsrc  , F_rdst , F_rsrc); // get forwarding select lines
	proc_mux p4(EX_data_out , ID_rdst_data , F_rdst , alu_input_a); // selecting forwarded rdst data or decoded rdst data
	proc_mux p5(EX_data_out , ID_rsrc_data , F_rsrc , alu_input_b); // selecting forwarded rsrc data or decoded rsrc data
	proc_mux p6(alu_out , ID_imm_data , ID_data_write , exe_out); // selecting 
	
	always@(negedge clk)
	begin
	
		// IF Stage
		pc = pc + 8'b00000001; // increment the pc
		IF_pipeline <= ins_code;
		
		// Decode stage
		case(ins_code[7:6]) // see the data to be read
			2'b00: 
			begin
				rdst = ins_code[5:3];
				imm = ins_code[2:0];
				addr = 6'bXXXXXX;
				rsrc = 3'bXXX;
			end
			2'b01:
			begin
				rdst = ins_code[5:3];
				rsrc = ins_code[2:0];
				imm = 3'bXXX;
				addr = 6'bXXXXXX;
			end
			2'b11:
			begin
				addr = ins_code[5:0];
				imm = 3'bXXX;
				rdst = 3'bXXX;
				rsrc = 3'bXXX;
			end
		endcase
		
		// pass control signals to ID/EX pipeline register
		ID_reg_write <= reg_write; 
		ID_reg_dst <= reg_dst;
		ID_PCSrc <= pc_src;
		ID_data_write <= data_write;
		ID_rdst <= IF_pipeline[5:3];
		ID_rsrc <= IF_pipeline[2:0];
		
		// sign extend the imm and partial address 
		imm_sign_extend <= {{5{imm[2]}},imm};
		addr_sign_extend <= {{2{addr[5]}},addr};
		ID_imm_data <= imm_sign_extend;
		ID_addr_data <= addr_sign_extend;
		
		// send next pc value to pipeline register
		ID_pc_next <= pc_next;
		
		// get the data from corresponding reg number and write data to the pipeline register
		ID_rsrc_data <= data_2;
		ID_rdst_data <= data_1;

		// pass values to EX/WB pipeline
		EX_reg_write <= ID_reg_write;
		EX_reg_dst <= ID_reg_dst;
		EX_PCSrc <= ID_PCSrc;
		EX_rdst <= ID_rdst;
		EX_data_out <= exe_out;
			
	end
endmodule
