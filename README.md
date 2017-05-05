# Processor_Verilog
Multiple Processors with individual Datapaths made using VErilog, implemented Pipelining and Forwarding in some Processors and Single cycle implementation of Others.

# Load Store Processor
Implements a 8 bit acrhitecture processor in Verilog having  2 in its ISA namely Load and Store, Progarm counter is 8 bits , regfile has 8 registers. Separate blocks implemented for separate stages. No pipelining or Forwarding implemented. Its a single cycle implementation with preloaded instructions that get initialised when Reset is triggered. No execute unit is involved here as there is no address to be calculated. The address is provided in the instruction by immediate data or through register

# Issues
  1. No forwarding or Pipelining
  2. When reset pin and clk pin overlap the first instruction doesn't execute


# JUMP ADD LI Processor
Implements a 8 bit acrhitecture processor in Verilog having  3 in its ISA namely Jump , Load Immediate and Add, Progarm counter is 8 bits , regfile has 8 registers. Separate blocks implemented for separate stages.  pipelining or Forwarding implemented. Its a single stage single cycle implementation with preloaded instructions that get initialised when Reset is triggered. It has no MEM stage as there is no involvement of Mem stage here, the Load instruction stores Immediate value provided. Opcode is 2 bits  and specific control signals are generated . Datapath for this Processor is provided in the folder
