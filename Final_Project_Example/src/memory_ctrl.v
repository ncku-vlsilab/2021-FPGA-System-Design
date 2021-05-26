//`include "memory.v"

module memory_ctrl(
	input					clk,
	input					rst,
	input                en,
	input   [5:0]  addr,
	input   [15:0] d,
	input 		en_r,
    input 		en_w,
	input 				cmd_valid,
	input 	[7:0]	cmd,
	input 	[15:0]	data_in,
	input 	[5:0]	address,
	input  [3:0] n,
	output 				cmd_done,
	output wire 	[15:0]	q,
	output wire  [15:0] mem0,
	output wire  [15:0] mem1,
	output wire  [15:0] mem2,
	output wire  [15:0] mem3,
	output reg done_arm,
	output reg done_arm2
);

wire 	[1:0]	next_state;
wire    [1:0]   next_clk_4;
wire            clk_4_f;
wire				write_enable;
wire	[15:0]	data_in_to_mem;
//wire    [15:0] q,mem0,mem1,mem2,mem3;

//wire done_arm=(state==2'd3&&address==6'd31)?1'b1:1'b0;

reg 	[1:0]	state;		//0 : wait_cmd	1 : read 2 : wrtie_edge 3 : idle
reg     [1:0]   clk_4;

assign			cmd_done = ((state == 2'd0) || (state == 2'd3))? 1'd1 : 1'd0;
assign			next_state = (state == 2'd0)? {cmd_valid & cmd[1], cmd_valid & cmd[0]} :
												 (state == 2'd1)? 2'd3 :
												 (state == 2'd2)? 2'd3 : {cmd_valid, cmd_valid};
assign			write_enable = (state == 2'd2)? 1'd1 : 1'd0;
assign			data_in_to_mem = (state == 2'd2)? data_in : 8'd0;
assign          next_clk_4 = (clk_4 == 2'd3)? 2'd0 : clk_4 + 2'd1;
assign          clk_4_f = clk_4[1];

memory memory(
	.clk(clk_4_f),	
	.en(en),
	.addr(addr),
	.d(d),
	.en_r(en_r),
	.en_w(en_w),           
	.write_enable(write_enable),
	.data_in(data_in_to_mem),
	.address(address),
	.q(q),
	.mem0(mem0),
	.mem1(mem1),
	.mem2(mem2),
	.mem3(mem3)
);
always @(posedge clk or posedge rst)
begin
	if(rst)
	begin
		clk_4	<= 2'd0;
	end
	else
	begin
		clk_4	<= next_clk_4;
	end
end

always@(posedge clk_4_f or posedge rst)
begin
  if(rst) done_arm=1'b0;
  else if(state==2'd3&&address==6'd31) done_arm<=1'b1;
  else done_arm<=1'b0;
end

always@(posedge clk_4_f or posedge rst)
begin
  if(rst) done_arm=1'b0;
  else if(state==2'd3&&address==6'd40) done_arm2<=1'b1;
  else done_arm2<=1'b0;
end

always @(posedge clk_4_f or posedge rst)
begin
	if(rst)
	begin
		state	<= 2'd0;
	end
	else
	begin
		state	<= next_state;
	end
end

endmodule
