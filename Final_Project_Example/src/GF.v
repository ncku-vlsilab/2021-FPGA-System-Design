`define RESET1  3'd0
`define SAVE   3'd1
`define GF0    3'd2
`define GF1    3'd3
`define XOR    3'd4
`define DONE1   3'd5

module GF(clk,rst,en,gf_xor,h0,addr,gf,MAC,done_GF,addr_h0);

input clk,rst;
input en;
input [15:0] gf_xor,h0;
input [5:0] addr;
input [3:0] addr_h0; 
output [15:0]gf,MAC;
output done_GF;


reg [15:0]gf,MAC;
reg done_GF;
reg [7:0] counter0 [15:0];

reg [2:0] state;
reg [2:0] next_state;

//reg [4:0] addr_rcon1;
reg [7:0] temp_h0;
reg [3:0] addr_gf;
reg [14:0] GF     [15:0];
reg [3:0] addr_m0,addr_m1,addr_m2; //for addrgf-1
reg [7:0] temp_counter0; // for counter0 and Cipher
reg [15:0] temp_gf;
reg [7:0] h [15:0];
reg counter_s;
reg [3:0] addr_xor;



always@(posedge clk or posedge rst)
begin
  if(rst)  state<=`RESET1;
  else if(en) state<=next_state;

end
/*
always@(posedge clk)
begin
if(en)begin
  if(state==`RESET1) addr_rcon1<=5'd0;
  else if(state==`DONE1)begin
    if(addr_rcon1!=5'd16) addr_rcon1<=addr_rcon1+5'd1;
  end
end
end*/

always@(posedge clk)
begin
if(en)begin
  if(state==`RESET1) begin
    counter0[0]<=8'h05;
    counter0[1]<=8'h22;
    counter0[2]<=8'h1a;
    counter0[3]<=8'h13;
    counter0[4]<=8'h09;
    counter0[5]<=8'hff;
    counter0[6]<=8'h32;
    counter0[7]<=8'hd1;
    counter0[8]<=8'h00;
    counter0[9]<=8'h00;
    counter0[10]<=8'h00;
    counter0[11]<=8'h00;
    counter0[12]<=8'h00;
    counter0[13]<=8'h00;
    counter0[14]<=8'h00;
    counter0[15]<=8'h00;
  end
  else if(state==`GF0&&addr>6'd0) counter0[addr_xor]<=(addr_xor[0]==1'b0)?gf_xor[15:8]:gf_xor[7:0];
end
end

//h
always@(posedge clk)
begin
if(en)begin
  if(state==`SAVE)begin
    if(addr_h0[0]==1'b0) h[addr_h0]<=h0[15:8];
    else h[addr_h0]<=h0[7:0];
  end
end
end

//counter_s
always@(posedge clk)
begin
if(en)begin
  if(state==`RESET1) counter_s<=1'b0;
  else if(state==`GF1&&temp_gf<8'd128) counter_s<=counter_s+1'b1;
end
end

//gf
always@(posedge clk)
begin
if(en)begin
  if(state==`RESET1) gf<=16'd0;
  else if(state==`GF1&&temp_gf<8'd128) begin
    if(addr_m0[0]==1'b0) gf[15:8]<=temp_gf[7:0];
    else gf[7:0]<=temp_gf[7:0];
  end
end
end

//addr_m0
always@(posedge clk)
begin
if(en)begin
  if(state==`RESET1) addr_m0<=4'd0;
  else if(state==`GF0) addr_m0<=addr_gf;
end
end

//addr_m1
always@(posedge clk)
begin
if(en)begin
  if(state==`RESET1) addr_m1<=4'd0;
  else if(state==`XOR) addr_m1<=addr_m1+4'd2;
end
end

//addr_m2
always@(posedge clk)
begin
if(en)begin
  if(state==`RESET1) addr_m2<=4'd1;
  else if(state==`XOR) addr_m2<=addr_m2+4'd2;
end
end

//addr_gf
always@(posedge clk)
begin
if(en)begin
  if(state==`RESET1) addr_gf<=4'd0;
  else if(state==`GF0)begin
    addr_gf<=addr_gf+4'd1; 
  end
end
end

//GF temp_gf
always@(posedge clk)
begin
if(en)begin
  if(state==`GF0)begin

 temp_gf<=(temp_h0[0]*temp_counter0)^((temp_h0[1]<<1'b1)*temp_counter0)^((temp_h0[2]<<2'd2)*temp_counter0)^((temp_h0[3]<<2'd3)*temp_counter0)^((temp_h0[4]<<3'd4)*temp_counter0)^((temp_h0[5]<<3'd5)*temp_counter0)^((temp_h0[6]<<3'd6)*temp_counter0)^((temp_h0[7]<<3'd7)*temp_counter0);
  //GF[addr_m0]<=temp_gf;
  end

  else if(state==`GF1)begin
    if(temp_gf[7]==1)  temp_gf<=temp_gf^8'd133;
    else if(temp_gf[8]==1) temp_gf<=temp_gf^16'd266;
    else if(temp_gf[9]==1) temp_gf<=temp_gf^16'd532;
    else if(temp_gf[10]==1) temp_gf<=temp_gf^16'd1164;
    else if(temp_gf[11]==1) temp_gf<=temp_gf^16'd2128;
    else if(temp_gf[12]==1) temp_gf<=temp_gf^16'd4256;
    else if(temp_gf[13]==1) temp_gf<=temp_gf^16'd8512;
    else if(temp_gf[14]==1) temp_gf<=temp_gf^16'd17024;
    else if(temp_gf[15]==1) temp_gf<=temp_gf^16'd34048;
  end

  else if(state==`XOR)begin
     MAC[15:8]<=gf[15:8]^h[addr_m1];
     MAC[7:0] <=gf[7:0]^h[addr_m2];
  end
end
end

//temp_h0
always@(*)
begin
if(en)begin
 if(state==`GF0) temp_h0=h[addr_gf];
 else temp_h0=8'd0;
end
end

always@(*)
begin
if(en)begin
  if(state==`GF0)begin
    /*if(addr_rcon1<=5'd15) temp_counter0=counter0[addr_gf];
    else temp_counter0=(addr_gf[0]==1'b0)?gf_xor[15:8]:gf_xor[7:0];*/
    temp_counter0=counter0[addr_gf];
  end
  else temp_counter0=8'd0;
end
end

//addr_xor
always@(*)
begin
if(en)begin
  if(state==`RESET1) addr_xor=4'd0;
  else if(state==`GF0) addr_xor=addr_gf-4'd2;
  else addr_xor=4'd0; 
end
end

always@(*)
begin
if(en)begin
  case(state)
    `RESET1:next_state=`SAVE;
    `SAVE:begin
        if(addr_h0==4'd15) next_state=`GF0;
        else next_state=`SAVE;
     end
    `GF0:begin
        next_state=`GF1;
     end
    `GF1:begin
      if(temp_gf<8'd128)begin
         if(counter_s==1'b1)begin
            if(addr>=6'd32) next_state=`XOR;
            else next_state=`DONE1;
         end
         else next_state=`GF0;
      end
      else next_state=`GF1;
   end
   `XOR:begin
       next_state=`DONE1;
    end
   `DONE1:begin
       if(addr==6'd39) next_state=`RESET1;
	   else next_state=`GF0;
	end
    default:next_state=`RESET1;
   endcase
end
end

always@(*)
begin
  if(state==`DONE1) done_GF=1'b1;
  else done_GF=1'b0;
end

endmodule
