
/*
`include "AES.v"
`include "XOR1.v"
`include "XOR2.v"
`include "GF.v"
`include "controller.v"*/

module top(clk,rst,q,done,done_arm,done_arm2,en_memory,en_r,en_w,addr,d,state,done2,MAC);
  
input clk,rst;
input [15:0] q;
input done_arm,done_arm2;
output done;
output en_memory,en_r,en_w;
output [5:0] addr;
output [15:0] d;
output wire [3:0] state;
output wire done2;
output [15:0] MAC;






wire clk,rst;
wire [5:0]	addr;
wire [15:0]	d;
wire [15:0]   q;
wire done_AES;
wire [15:0] data_d;
wire [15:0] xor1_q;
wire [15:0] gf_xor;
wire [15:0] gf;
wire [15:0] MAC;
wire done_GF;
wire [3:0] addr_h0;


wire en_memory,en_r,en_w,en_AES,en_XOR1,en_XOR2,en_GF,en_mux,done;

wire    [1:0]   next_clk_4;
wire            clk_4_f;
reg     [1:0]   clk_4;
assign          next_clk_4 = (clk_4 == 2'd3)? 2'd0 : clk_4 + 2'd1;
assign          clk_4_f = clk_4[1];

assign d=(en_mux)?xor1_q:MAC;

//memory memory(.clk(clk), .en(en_memory), .en_r(en_r), .en_w(en_w), .addr(addr), .d(d), .q(q));

AES AES(.clk(clk_4_f),.rst(rst),.en(en_AES),.addr(addr),.done_AES(done_AES),.data_d(data_d),.done(done));

XOR1 XOR1(.clk(clk_4_f),.en(en_XOR1),.plaintext(q),.d(data_d),.q(xor1_q));

GF GF(.clk(clk_4_f),.rst(rst),.en(en_GF),.gf_xor(gf_xor),.h0(data_d),.addr(addr),.gf(gf),.MAC(MAC),.done_GF(done_GF),.addr_h0(addr_h0));

XOR2 XOR2(.clk(clk_4_f),.en(en_XOR2),.cipher(q),.gf(gf),.gf_xor(gf_xor));

controller controller(.clk(clk_4_f),.rst(rst),.done_AES(done_AES),.done_GF(done_GF),.done_arm(done_arm),.done_arm2(done_arm2),.addr(addr),.en_memory(en_memory),.en_r(en_r),.en_w(en_w),.en_AES(en_AES),.en_XOR1(en_XOR1),.en_XOR2(en_XOR2),.en_GF(en_GF),.en_mux(en_mux),.done(done),.addr_h0(addr_h0),.state(state),.done2(done2));

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

endmodule
