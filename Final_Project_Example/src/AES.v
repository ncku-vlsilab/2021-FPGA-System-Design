
`define RESET0 4'd0
`define Roundkey0 4'd1
`define Roundkey1 4'd2
`define Roundkey2 4'd3
`define Roundkey3 4'd4
`define Add_c 4'd5
`define Sub0  4'd6
`define Sub   4'd7
`define Shift 4'd8
`define Mix   4'd9
`define Add_r 4'd10
`define DONE  4'd11

module AES(clk,rst,en,addr,done_AES,data_d,done);

input clk,rst;
input en;
input [5:0] addr;
input done;
output done_AES;
output [15:0] data_d;

reg done_AES;
reg [15:0] data_d;
reg [3:0] state;
reg [3:0] next_state;

reg [2:0] counter_done;

reg [7:0] roundkey [159:0];
reg [7:0] temp00;//CipherKey or h
reg [7:0] temp01;//CipherKey
reg [7:0] temp02;//CipherKey
reg [7:0] temp03;//CipherKey
reg [7:0] temp1 [3:0];//16x+y

reg [1:0] counter_r;
reg counter_s;//Sub

reg [7:0] addr_r0; //roundkey 
reg [7:0] addr_r1; 
reg [7:0] addr_r2;
reg [7:0] addr_r3;//********************dont move

reg [7:0] addr_r00; //combinational addr_r0-1 or -13
reg [7:0] addr_r01;
reg [7:0] addr_r02;
reg [7:0] addr_r03;

reg [7:0] addr_r10; //combinational addr_r0-16
reg [7:0] addr_r11;
reg [7:0] addr_r12;
reg [7:0] addr_r13;

reg [5:0] addr_rcon0; //rcon and Add_c
reg [5:0] addr_rcon1; //rcon and XOR
reg [5:0] addr_rcon2;
reg [5:0] addr_rcon3;

reg [7:0] Rcon [39:0];
reg [7:0] SBOX [255:0];
reg [7:0] counter [15:0];
reg [7:0] counter0 [15:0];
reg [7:0] CipherKey [15:0];


reg [7:0] addr_a [15:0];

reg [7:0] h3 [15:0];
reg [7:0] h0 [15:0];

reg [7:0] temp_s[3:0];//shift
reg [7:0] temp_m[3:0];//mix
reg [3:0] addr_m [3:0];//mix 

//reg [3:0] addr_h30;
//reg [3:0] addr_h31;

//**************0825
reg [3:0] addr_h32;
reg [3:0] addr_h33;

//addr_h32,33
always@(posedge clk)
begin
if(en)begin
  if(state==`RESET0)begin
     addr_h32<=4'd0;
	 addr_h33<=4'd1;
  end
  else if(state==`DONE)begin
     addr_h32<=addr_h32+4'd2;
	 addr_h33<=addr_h33+4'd2;
  end
end
end

always@(posedge clk or posedge rst)
begin
  if(rst)  state<=`RESET0;
  else if(en) state<=next_state;

end

always@(posedge clk)
begin
if(en)begin
  if(state==`RESET0)begin
    Rcon[0]<=8'h01;
    Rcon[1]<=8'h02;
    Rcon[2]<=8'h04;
    Rcon[3]<=8'h08;
    Rcon[4]<=8'h10;
    Rcon[5]<=8'h20;
    Rcon[6]<=8'h40;
    Rcon[7]<=8'h80;
    Rcon[8]<=8'h1b;
    Rcon[9]<=8'h36;
    Rcon[10]<=8'h00;
    Rcon[11]<=8'h00;
    Rcon[12]<=8'h00;
    Rcon[13]<=8'h00;
    Rcon[14]<=8'h00;
    Rcon[15]<=8'h00;
    Rcon[16]<=8'h00;
    Rcon[17]<=8'h00;
    Rcon[18]<=8'h00;
    Rcon[19]<=8'h00;
    Rcon[20]<=8'h00;
    Rcon[21]<=8'h00;
    Rcon[22]<=8'h00;
    Rcon[23]<=8'h00;
    Rcon[24]<=8'h00;
    Rcon[25]<=8'h00;
    Rcon[26]<=8'h00;
    Rcon[27]<=8'h00;
    Rcon[28]<=8'h00;
    Rcon[29]<=8'h00;
    Rcon[30]<=8'h00;
    Rcon[31]<=8'h00;
    Rcon[32]<=8'h00;
    Rcon[33]<=8'h00;
    Rcon[34]<=8'h00;
    Rcon[35]<=8'h00;
    Rcon[36]<=8'h00;
    Rcon[37]<=8'h00;
    Rcon[38]<=8'h00;
    Rcon[39]<=8'h00;

    SBOX[0]<=8'h63;
    SBOX[1]<=8'h7c;
    SBOX[2]<=8'h77;
    SBOX[3]<=8'h7b;
    SBOX[4]<=8'hf2;
    SBOX[5]<=8'h6b;
    SBOX[6]<=8'h6f;
    SBOX[7]<=8'hc5;
    SBOX[8]<=8'h30;
    SBOX[9]<=8'h01;
    SBOX[10]<=8'h67;
    SBOX[11]<=8'h2b;
    SBOX[12]<=8'hfe;
    SBOX[13]<=8'hd7;
    SBOX[14]<=8'hab;
    SBOX[15]<=8'h76;
    SBOX[16]<=8'hca;
    SBOX[17]<=8'h82;
    SBOX[18]<=8'hc9;
    SBOX[19]<=8'h7d;
    SBOX[20]<=8'hfa;
    SBOX[21]<=8'h59;
    SBOX[22]<=8'h47;
    SBOX[23]<=8'hf0;
    SBOX[24]<=8'had;
    SBOX[25]<=8'hd4;
    SBOX[26]<=8'ha2;
    SBOX[27]<=8'haf;
    SBOX[28]<=8'h9c;
    SBOX[29]<=8'ha4;
    SBOX[30]<=8'h72;
    SBOX[31]<=8'hc0;
    SBOX[32]<=8'hb7;
    SBOX[33]<=8'hfd;
    SBOX[34]<=8'h93;
    SBOX[35]<=8'h26;
    SBOX[36]<=8'h36;
    SBOX[37]<=8'h3f;
    SBOX[38]<=8'hf7;
    SBOX[39]<=8'hcc;
    SBOX[40]<=8'h34;
    SBOX[41]<=8'ha5;
    SBOX[42]<=8'he5;
    SBOX[43]<=8'hf1;
    SBOX[44]<=8'h71;
    SBOX[45]<=8'hd8;
    SBOX[46]<=8'h31;
    SBOX[47]<=8'h15;
    SBOX[48]<=8'h04;
    SBOX[49]<=8'hc7;
    SBOX[50]<=8'h23;
    SBOX[51]<=8'hc3;
    SBOX[52]<=8'h18;
    SBOX[53]<=8'h96;
    SBOX[54]<=8'h05;
    SBOX[55]<=8'h9a;
    SBOX[56]<=8'h07;
    SBOX[57]<=8'h12;
    SBOX[58]<=8'h80;
    SBOX[59]<=8'he2;
    SBOX[60]<=8'heb;
    SBOX[61]<=8'h27;
    SBOX[62]<=8'hb2;
    SBOX[63]<=8'h75;
    SBOX[64]<=8'h09;
    SBOX[65]<=8'h83;
    SBOX[66]<=8'h2c;
    SBOX[67]<=8'h1a;
    SBOX[68]<=8'h1b;
    SBOX[69]<=8'h6e;
    SBOX[70]<=8'h5a;
    SBOX[71]<=8'ha0;
    SBOX[72]<=8'h52;
    SBOX[73]<=8'h3b;
    SBOX[74]<=8'hd6;
    SBOX[75]<=8'hb3;
    SBOX[76]<=8'h29;
    SBOX[77]<=8'he3;
    SBOX[78]<=8'h2f;
    SBOX[79]<=8'h84;
    SBOX[80]<=8'h53;
    SBOX[81]<=8'hd1;
    SBOX[82]<=8'h00;
    SBOX[83]<=8'hed;
    SBOX[84]<=8'h20;
    SBOX[85]<=8'hfc;
    SBOX[86]<=8'hb1;
    SBOX[87]<=8'h5b;
    SBOX[88]<=8'h6a;
    SBOX[89]<=8'hcb;
    SBOX[90]<=8'hbe;
    SBOX[91]<=8'h39;
    SBOX[92]<=8'h4a;
    SBOX[93]<=8'h4c;
    SBOX[94]<=8'h58;
    SBOX[95]<=8'hcf;
    SBOX[96]<=8'hd6;
    SBOX[97]<=8'hef;
    SBOX[98]<=8'haa;
    SBOX[99]<=8'hfb;

    SBOX[100]<=8'h43;
    SBOX[101]<=8'h4d;
    SBOX[102]<=8'h33;
    SBOX[103]<=8'h85;
    SBOX[104]<=8'h45;
    SBOX[105]<=8'hf9;
    SBOX[106]<=8'h02;
    SBOX[107]<=8'h7f;
    SBOX[108]<=8'h50;
    SBOX[109]<=8'h3c;
    SBOX[110]<=8'h9f;
    SBOX[111]<=8'ha8;
    SBOX[112]<=8'h51;
    SBOX[113]<=8'ha3;
    SBOX[114]<=8'h40;
    SBOX[115]<=8'h8f;
    SBOX[116]<=8'h92;
    SBOX[117]<=8'h9d;
    SBOX[118]<=8'h38;
    SBOX[119]<=8'hf5;
    SBOX[120]<=8'hbc;
    SBOX[121]<=8'hb6;
    SBOX[122]<=8'hda;
    SBOX[123]<=8'h21;
    SBOX[124]<=8'h10;
    SBOX[125]<=8'hff;
    SBOX[126]<=8'hf3;
    SBOX[127]<=8'hd2;
    SBOX[128]<=8'hcd;
    SBOX[129]<=8'h0c;
    SBOX[130]<=8'h13;
    SBOX[131]<=8'hec;
    SBOX[132]<=8'h5f;
    SBOX[133]<=8'h97;
    SBOX[134]<=8'h44;
    SBOX[135]<=8'h17;
    SBOX[136]<=8'hc4;
    SBOX[137]<=8'ha7;
    SBOX[138]<=8'h7e;
    SBOX[139]<=8'h3d;
    SBOX[140]<=8'h64;
    SBOX[141]<=8'h5d;
    SBOX[142]<=8'h19;
    SBOX[143]<=8'h73;
    SBOX[144]<=8'h60;
    SBOX[145]<=8'h81;
    SBOX[146]<=8'h4f;
    SBOX[147]<=8'hdc;
    SBOX[148]<=8'h22;
    SBOX[149]<=8'h2a;
    SBOX[150]<=8'h90;
    SBOX[151]<=8'h88;
    SBOX[152]<=8'h46;
    SBOX[153]<=8'hee;
    SBOX[154]<=8'hb8;
    SBOX[155]<=8'h14;
    SBOX[156]<=8'hde;
    SBOX[157]<=8'h5e;
    SBOX[158]<=8'h0b;
    SBOX[159]<=8'hdb;
    SBOX[160]<=8'he0;
    SBOX[161]<=8'h32;
    SBOX[162]<=8'h3a;
    SBOX[163]<=8'h0a;
    SBOX[164]<=8'h49;
    SBOX[165]<=8'h06;
    SBOX[166]<=8'h24;
    SBOX[167]<=8'h5c;
    SBOX[168]<=8'hc2;
    SBOX[169]<=8'hd3;
    SBOX[170]<=8'hac;
    SBOX[171]<=8'h62;
    SBOX[172]<=8'h91;
    SBOX[173]<=8'h95;
    SBOX[174]<=8'he4;
    SBOX[175]<=8'h79;
    SBOX[176]<=8'he7;
    SBOX[177]<=8'hc8;
    SBOX[178]<=8'h37;
    SBOX[179]<=8'h6d;
    SBOX[180]<=8'h8d;
    SBOX[181]<=8'hd5;
    SBOX[182]<=8'h4e;
    SBOX[183]<=8'ha9;
    SBOX[184]<=8'h6c;
    SBOX[185]<=8'h56;
    SBOX[186]<=8'hf4;
    SBOX[187]<=8'hea;
    SBOX[188]<=8'h65;
    SBOX[189]<=8'h7a;
    SBOX[190]<=8'hae;
    SBOX[191]<=8'h08;
    SBOX[192]<=8'hba;
    SBOX[193]<=8'h78;
    SBOX[194]<=8'h25;
    SBOX[195]<=8'h2e;
    SBOX[196]<=8'h1c;
    SBOX[197]<=8'ha6;
    SBOX[198]<=8'hb4;
    SBOX[199]<=8'hc6;

    SBOX[200]<=8'he8;
    SBOX[201]<=8'hdd;
    SBOX[202]<=8'h74;
    SBOX[203]<=8'h1f;
    SBOX[204]<=8'h4b;
    SBOX[205]<=8'hbd;
    SBOX[206]<=8'h8b;
    SBOX[207]<=8'h8a;
    SBOX[208]<=8'h70;
    SBOX[209]<=8'h3e;
    SBOX[210]<=8'hb5;
    SBOX[211]<=8'h66;
    SBOX[212]<=8'h48;
    SBOX[213]<=8'h03;
    SBOX[214]<=8'hf6;
    SBOX[215]<=8'h0e;
    SBOX[216]<=8'h61;
    SBOX[217]<=8'h35;
    SBOX[218]<=8'h57;
    SBOX[219]<=8'hb9;
    SBOX[220]<=8'h86;
    SBOX[221]<=8'hc1;
    SBOX[222]<=8'h1d;
    SBOX[223]<=8'h9e;
    SBOX[224]<=8'he1;
    SBOX[225]<=8'hf8;
    SBOX[226]<=8'h98;
    SBOX[227]<=8'h11;
    SBOX[228]<=8'h69;
    SBOX[229]<=8'hd9;
    SBOX[230]<=8'h8e;
    SBOX[231]<=8'h94;
    SBOX[232]<=8'h9b;
    SBOX[233]<=8'h1e;
    SBOX[234]<=8'h87;
    SBOX[235]<=8'he9;
    SBOX[236]<=8'hce;
    SBOX[237]<=8'h55;
    SBOX[238]<=8'h28;
    SBOX[239]<=8'hdf;
    SBOX[240]<=8'h8c;
    SBOX[241]<=8'ha1;
    SBOX[242]<=8'h89;
    SBOX[243]<=8'h0d;
    SBOX[244]<=8'hbf;
    SBOX[245]<=8'he6;
    SBOX[246]<=8'h42;
    SBOX[247]<=8'h68;
    SBOX[248]<=8'h41;
    SBOX[249]<=8'h99;
    SBOX[250]<=8'h2d;
    SBOX[251]<=8'h0f;
    SBOX[252]<=8'hb0;
    SBOX[253]<=8'h54;
    SBOX[254]<=8'hbb;
    SBOX[255]<=8'h16;

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
    counter0[15]<=(done)?8'h00:8'h01;

    CipherKey[0]<=8'h2b;
    CipherKey[1]<=8'h28;
    CipherKey[2]<=8'hab;
    CipherKey[3]<=8'h09;
    CipherKey[4]<=8'h7e;
    CipherKey[5]<=8'hae;
    CipherKey[6]<=8'hf7;
    CipherKey[7]<=8'hcf;
    CipherKey[8]<=8'h15;
    CipherKey[9]<=8'hd2;
    CipherKey[10]<=8'h15;
    CipherKey[11]<=8'h4f;
    CipherKey[12]<=8'h16;
    CipherKey[13]<=8'ha6;
    CipherKey[14]<=8'h88;
    CipherKey[15]<=8'h3c;
  end
end
end

//counter_done
always@(posedge clk)
begin
if(en)begin
  if(state==`RESET0) counter_done<=3'd0;
  else if(state==`DONE) counter_done<=counter_done+3'd1;
end
end
//addr_h30,31
/*
always@(posedge clk)
begin
  if(state==`RESET0)begin
    addr_h30<=4'd0;
    addr_h31<=4'd1;
  end
  else if(state==`Cipher&&counter_r==2'd1)begin
    addr_h30<=addr_h30+4'd2;
    addr_h31<=addr_h31+4'd2;
  end
end*/

//counter_s
always@(posedge clk)
begin
if(en)begin
  if(state==`RESET0) counter_s<=1'b0;
  else if(state==`Sub||state==`Mix/*||state==`Cipher*/) counter_s<=counter_s+1'b1;
  //else if(state==`Add_c) counter_s<=counter_s+1'b1;
end
end
//counter_r
always@(posedge clk)
begin
if(en)begin
  if(state==`RESET0) counter_r<=2'd0;
  else if(state==`Roundkey0)begin
       if(counter_r==2'd1) counter_r<=2'd0;
       else  counter_r<=counter_r+2'd1;
  end
  else if(state==`Roundkey1)begin
      if(counter_r==2'd2) counter_r<=2'd0;
      else counter_r<=counter_r+2'd1;
  end

  else if(state==`Roundkey2)begin
      if(counter_r==2'd1) counter_r<=2'd0;
      else counter_r<=counter_r+2'd1;
  end
  else if(state==`Roundkey3/*||state==`Cipher*/)begin
      if(counter_r==2'd2) counter_r<=2'd0;
      else counter_r<=counter_r+2'd1;
  end
end
end

//addr_r0~4
always@(posedge clk)
begin
if(en)begin
  if(state==`RESET0)begin
     addr_r0<=8'd1;
     addr_r1<=8'd5;
     addr_r2<=8'd9;
     addr_r3<=8'd13;
  end
  else if(state==`Roundkey1||state==`Roundkey3)begin
     if(counter_r==2'd2&&addr_r3!=8'd159)begin
     addr_r0<=addr_r0+8'd13;
     addr_r1<=addr_r1+8'd13;
     addr_r2<=addr_r2+8'd13;
     addr_r3<=addr_r3+8'd13;
     end
     else if(addr_r3!=8'd159) begin
     addr_r0<=addr_r0+8'd1;
     addr_r1<=addr_r1+8'd1;
     addr_r2<=addr_r2+8'd1;
     addr_r3<=addr_r3+8'd1;
     end
  end
  else if(state==`Roundkey2)begin
     if(counter_r==2'd1)begin
     addr_r0<=addr_r0+8'd1;
     addr_r1<=addr_r1+8'd1;
     addr_r2<=addr_r2+8'd1;
     addr_r3<=addr_r3+8'd1;
     end
  end
end
end

//addr_m
always@(posedge clk)
begin
if(en)begin
  if(state==`RESET0||state==`Add_r)begin
   addr_m[0]<=4'd0;
   addr_m[1]<=4'd4;
   addr_m[2]<=4'd8;
   addr_m[3]<=4'd12;
  end
  else if(state==`Mix)begin
    if(counter_s==1'b1)begin
      addr_m[0]<=addr_m[0]+4'd1;
      addr_m[1]<=addr_m[1]+4'd1;
      addr_m[2]<=addr_m[2]+4'd1;
      addr_m[3]<=addr_m[3]+4'd1;
    end
  end
end
end


//addr_rcon
always@(posedge clk)
begin
if(en)begin
  if(state==`RESET0)begin
    addr_rcon0<=6'd1;
    addr_rcon1<=6'd11;
    addr_rcon2<=6'd21;
    addr_rcon3<=6'd31;
  end
  else if(state==`Roundkey2)begin
    if(counter_r==2'd1)begin
    addr_rcon0<=addr_rcon0+6'd1;
    addr_rcon1<=addr_rcon1+6'd1;
    addr_rcon2<=addr_rcon2+6'd1;
    addr_rcon3<=addr_rcon3+6'd1;
    end
  end
  else if(state==`Roundkey3)begin
    if(addr_r3==8'd159)  addr_rcon0<=6'd0;
  end
  else if(state==`Sub)begin
    if(addr_r3==8'd159&&counter_s==1'b1)begin
      if(addr_rcon0==6'd15) addr_rcon0<=6'd0;
      else  addr_rcon0<=addr_rcon0+6'd1;
    end
  end
  else if(state==`Shift)begin
     addr_rcon0<=6'd0;
     addr_rcon1<=6'd0;
  end
  /*else if(state==`XOR)begin
    if(addr_rcon1!=6'd16) addr_rcon1<=addr_rcon1+6'd1;
  end*/
end
end

//counter
always@(posedge clk)
begin
if(en)begin
  if(state==`Roundkey0)begin
     counter[0]<=counter0[0];
     counter[1]<=counter0[1];
     counter[2]<=counter0[2];
     counter[3]<=counter0[3];
     counter[4]<=counter0[4];
     counter[5]<=counter0[5];
     counter[6]<=counter0[6];
     counter[7]<=counter0[7];
     counter[8]<=counter0[8];
     counter[9]<=counter0[9];
     counter[10]<=counter0[10];
     counter[11]<=counter0[11];
     counter[12]<=counter0[12];
     counter[13]<=counter0[13];
     counter[14]<=counter0[14];
     counter[15]<=counter0[15];
  end
  else if(state==`Add_r&&addr_a[15]==8'd159)begin
      counter[15]<=counter[15]+8'd1;
   if(counter[15]==8'd255) counter[14]<=counter[14]+8'd1;
  end
  else if(state==`DONE&&(addr==6'd24||addr==6'd32))begin
    counter[15]<=8'd0;
    counter[14]<=8'd0;
  end
end
end

//addr_a
always@(posedge clk)
begin
if(en)begin
  if(state==`RESET0)begin
    addr_a[0]<=8'd0;
    addr_a[1]<=8'd1;
    addr_a[2]<=8'd2;
    addr_a[3]<=8'd3;
    addr_a[4]<=8'd4;
    addr_a[5]<=8'd5;
    addr_a[6]<=8'd6;
    addr_a[7]<=8'd7;
    addr_a[8]<=8'd8;
    addr_a[9]<=8'd9;
    addr_a[10]<=8'd10;
    addr_a[11]<=8'd11;
    addr_a[12]<=8'd12;
    addr_a[13]<=8'd13;
    addr_a[14]<=8'd14;
    addr_a[15]<=8'd15;
  end
  else if(state==`Add_r)begin
   if(addr_a[15]==8'd159)begin
    addr_a[0]<=8'd0;
    addr_a[1]<=8'd1;
    addr_a[2]<=8'd2;
    addr_a[3]<=8'd3;
    addr_a[4]<=8'd4;
    addr_a[5]<=8'd5;
    addr_a[6]<=8'd6;
    addr_a[7]<=8'd7;
    addr_a[8]<=8'd8;
    addr_a[9]<=8'd9;
    addr_a[10]<=8'd10;
    addr_a[11]<=8'd11;
    addr_a[12]<=8'd12;
    addr_a[13]<=8'd13;
    addr_a[14]<=8'd14;
    addr_a[15]<=8'd15;
   end
   else begin
    addr_a[0]<=addr_a[0]+8'd16;
    addr_a[1]<=addr_a[1]+8'd16;
    addr_a[2]<=addr_a[2]+8'd16;
    addr_a[3]<=addr_a[3]+8'd16;
    addr_a[4]<=addr_a[4]+8'd16;
    addr_a[5]<=addr_a[5]+8'd16;
    addr_a[6]<=addr_a[6]+8'd16;
    addr_a[7]<=addr_a[7]+8'd16;
    addr_a[8]<=addr_a[8]+8'd16;
    addr_a[9]<=addr_a[9]+8'd16;
    addr_a[10]<=addr_a[10]+8'd16;
    addr_a[11]<=addr_a[11]+8'd16;
    addr_a[12]<=addr_a[12]+8'd16;
    addr_a[13]<=addr_a[13]+8'd16;
    addr_a[14]<=addr_a[14]+8'd16;
    addr_a[15]<=addr_a[15]+8'd16;
   end
  end
end
end

//roundkey
always@(posedge clk)
begin
if(en)begin
  if(state==`Roundkey0)begin
   if(counter_r!=2'd0) begin
     roundkey[0]<=temp00^CipherKey[0]^Rcon[0];
     roundkey[4]<=temp01^CipherKey[4]^Rcon[10];
     roundkey[8]<=temp02^CipherKey[8]^Rcon[20];
     roundkey[12]<=temp03^CipherKey[12]^Rcon[30];
   end
  end//end R0

  else if(state==`Roundkey1)begin
    roundkey[addr_r0]<=CipherKey[addr_r0]^roundkey[addr_r00];
    roundkey[addr_r1]<=CipherKey[addr_r1]^roundkey[addr_r01];
    roundkey[addr_r2]<=CipherKey[addr_r2]^roundkey[addr_r02];
    roundkey[addr_r3]<=CipherKey[addr_r3]^roundkey[addr_r03];
  end
  else if(state==`Roundkey2)begin
   if(counter_r!=2'd0)begin
     roundkey[addr_r0]<=temp00^roundkey[addr_r10]^Rcon[addr_rcon0];
     roundkey[addr_r1]<=temp01^roundkey[addr_r11]^Rcon[addr_rcon1];
     roundkey[addr_r2]<=temp02^roundkey[addr_r12]^Rcon[addr_rcon2];
     roundkey[addr_r3]<=temp03^roundkey[addr_r13]^Rcon[addr_rcon3];
   end
  end
  else if(state==`Roundkey3)begin
    roundkey[addr_r0]<=roundkey[addr_r10]^roundkey[addr_r00];
    roundkey[addr_r1]<=roundkey[addr_r11]^roundkey[addr_r01];
    roundkey[addr_r2]<=roundkey[addr_r12]^roundkey[addr_r02];
    roundkey[addr_r3]<=roundkey[addr_r13]^roundkey[addr_r03];
  end
end
end

//temp00,SBOX
always@(posedge clk)
begin
if(en)begin
   if(state==`Roundkey0)begin
   if(counter_r==2'd0)begin
     temp00<=CipherKey[7];
     temp01<=CipherKey[11];
     temp02<=CipherKey[15];
     temp03<=CipherKey[3];
   end
   end
  else if(state==`Roundkey2)begin
   if(counter_r==2'd0)begin
     temp00<=roundkey[addr_r01];
     temp01<=roundkey[addr_r02];
     temp02<=roundkey[addr_r03];
     temp03<=roundkey[addr_r00];
   end
   end
  else if(state==`Sub0)begin
   //if(counter_s==1'b1)begin
     temp00<=h3[addr_rcon0];
    /* temp01<=h1[addr_rcon0];
     temp02<=h2[addr_rcon0];
     temp03<=h3[addr_rcon0];*/
   //end
  end
   else if(state==`Sub)begin
      if(counter_s==1'b0)begin
       temp1[0]<=5'd16*temp00[7:4]+temp00[3:0];
       temp1[1]<=5'd16*temp01[7:4]+temp01[3:0];
       temp1[2]<=5'd16*temp02[7:4]+temp02[3:0];
       temp1[3]<=5'd16*temp03[7:4]+temp03[3:0];
      end
      else if(addr_r3!=8'd159) begin
         
        /*if(addr_r3==8'd159)begin
          h3[addr_rcon0]<=SBOX[temp1[0]];
          h1[addr_rcon0]<=SBOX[temp1[1]];
          h2[addr_rcon0]<=SBOX[temp1[2]];
          h3[addr_rcon0]<=SBOX[temp1[3]];
        end
        else begin*/
         temp00<=SBOX[temp1[0]];
         temp01<=SBOX[temp1[1]];
         temp02<=SBOX[temp1[2]];
         temp03<=SBOX[temp1[3]];
       // end
        
      end
   end
end
end

//addr_r00~r03
always@(*)
begin
if(en)begin
   if(state==`Roundkey1||state==`Roundkey3)begin
     addr_r00=addr_r0-8'd1;
     addr_r01=addr_r1-8'd1;
     addr_r02=addr_r2-8'd1;
     addr_r03=addr_r3-8'd1;
   end
   else if(state==`Roundkey2)begin
     addr_r00=addr_r0-8'd13;
     addr_r01=addr_r1-8'd13;
     addr_r02=addr_r2-8'd13;
     addr_r03=addr_r3-8'd13;
   end
   else begin
     addr_r00=8'd0;
     addr_r01=8'd0;
     addr_r02=8'd0;
     addr_r03=8'd0;
   end
end
end

//addr_r10~r13
always@(*)
begin
if(en)begin
  if(state==`Roundkey2||state==`Roundkey3)begin
     addr_r10=addr_r0-8'd16;
     addr_r11=addr_r1-8'd16;
     addr_r12=addr_r2-8'd16;
     addr_r13=addr_r3-8'd16;   
  end
  else begin
     addr_r10=8'd0;
     addr_r11=8'd0;
     addr_r12=8'd0;
     addr_r13=8'd0;
  end
end
end

//************************roundkey finish***********************

//temp_m
always@(posedge clk)
begin
if(en)begin
  if(state==`Mix)begin
     if(counter_s==1'b0)begin
     temp_m[0]<=(h3[addr_m[0]]>=8'd128)?((h3[addr_m[0]]<<1'b1)^8'h1B):h3[addr_m[0]]<<1'b1;
     temp_m[1]<=(h3[addr_m[1]]>=8'd128)?((h3[addr_m[1]]<<1'b1)^8'h1B):h3[addr_m[1]]<<1'b1;
     temp_m[2]<=(h3[addr_m[2]]>=8'd128)?((h3[addr_m[2]]<<1'b1)^8'h1B):h3[addr_m[2]]<<1'b1;
     temp_m[3]<=(h3[addr_m[3]]>=8'd128)?((h3[addr_m[3]]<<1'b1)^8'h1B):h3[addr_m[3]]<<1'b1;
     end
  end
end
end

//h3
always@(posedge clk)
begin
if(en)begin
  if(state==`Add_c)begin
    h3[0]<=CipherKey[0]^counter[0];
    h3[1]<=CipherKey[1]^counter[1];
    h3[2]<=CipherKey[2]^counter[2];
    h3[3]<=CipherKey[3]^counter[3];
    h3[4]<=CipherKey[4]^counter[4];
    h3[5]<=CipherKey[5]^counter[5];
    h3[6]<=CipherKey[6]^counter[6];
    h3[7]<=CipherKey[7]^counter[7];
    h3[8]<=CipherKey[8]^counter[8];
    h3[9]<=CipherKey[9]^counter[9];
    h3[10]<=CipherKey[10]^counter[10];
    h3[11]<=CipherKey[11]^counter[11];
    h3[12]<=CipherKey[12]^counter[12];
    h3[13]<=CipherKey[13]^counter[13];
    h3[14]<=CipherKey[14]^counter[14];
    h3[15]<=CipherKey[15]^counter[15];
 
  end
  else if(state==`Sub)begin
     if(addr_r3==8'd159&&counter_s!=1'b0)begin
          h3[addr_rcon0]<=SBOX[temp1[0]];
         /* h1[addr_rcon0]<=SBOX[temp1[1]];
          h2[addr_rcon0]<=SBOX[temp1[2]];
          h3[addr_rcon0]<=SBOX[temp1[3]];*/
     end
   end

  else if(state==`Shift)begin
    h3[4]<=h3[5];
    h3[5]<=h3[6];
    h3[6]<=h3[7];
    h3[7]<=temp_s[0];
    h3[8]<=h3[10];
    h3[9]<=h3[11];
    h3[10]<=temp_s[1];
    h3[11]<=temp_s[2];
    h3[12]<=h3[15];
    h3[13]<=temp_s[3];
    h3[14]<=h3[13];
    h3[15]<=h3[14];

  
  end
  else if(state==`Mix)begin
     if(counter_s==1'b1)begin
       h3[addr_m[0]]<=temp_m[0]^temp_m[1]^h3[addr_m[1]]^h3[addr_m[2]]^h3[addr_m[3]];
       h3[addr_m[1]]<=temp_m[1]^temp_m[2]^h3[addr_m[0]]^h3[addr_m[2]]^h3[addr_m[3]];
       h3[addr_m[2]]<=temp_m[2]^temp_m[3]^h3[addr_m[0]]^h3[addr_m[1]]^h3[addr_m[3]];
       h3[addr_m[3]]<=temp_m[3]^temp_m[0]^h3[addr_m[0]]^h3[addr_m[1]]^h3[addr_m[2]];
     end
  end
  else if(state==`Add_r)begin
    h3[0]<=roundkey[addr_a[0]]^h3[0];
    h3[1]<=roundkey[addr_a[1]]^h3[1];  
    h3[2]<=roundkey[addr_a[2]]^h3[2]; 
    h3[3]<=roundkey[addr_a[3]]^h3[3]; 
    h3[4]<=roundkey[addr_a[4]]^h3[4]; 
    h3[5]<=roundkey[addr_a[5]]^h3[5]; 
    h3[6]<=roundkey[addr_a[6]]^h3[6]; 
    h3[7]<=roundkey[addr_a[7]]^h3[7]; 
    h3[8]<=roundkey[addr_a[8]]^h3[8]; 
    h3[9]<=roundkey[addr_a[9]]^h3[9];  
    h3[10]<=roundkey[addr_a[10]]^h3[10];
    h3[11]<=roundkey[addr_a[11]]^h3[11];  
    h3[12]<=roundkey[addr_a[12]]^h3[12]; 
    h3[13]<=roundkey[addr_a[13]]^h3[13]; 
    h3[14]<=roundkey[addr_a[14]]^h3[14]; 
    h3[15]<=roundkey[addr_a[15]]^h3[15];    
  end
end
end
/*
always@(posedge clk)
begin
if(en)begin
  if(state==`Add_c)begin
    if(counter[15]==8'd1&&counter[14]==8'd0) begin
     h0[0]<=h3[0];
     h0[1]<=h3[1];
     h0[2]<=h3[2];
     h0[3]<=h3[3];
     h0[4]<=h3[4];
     h0[5]<=h3[5];
     h0[6]<=h3[6];
     h0[7]<=h3[7];
     h0[8]<=h3[8];
     h0[9]<=h3[9];
     h0[10]<=h3[10];
     h0[11]<=h3[11];
     h0[12]<=h3[12];
     h0[13]<=h3[13];
     h0[14]<=h3[14];
     h0[15]<=h3[15];
    end
  end
end
end
*/
//data_d
always@(posedge clk)
begin
if(en)begin
  if(state==`RESET0) data_d<=16'd0;
  /*else if(state==`Cipher)begin
     if(counter_r==2'd1) data_d<={(h3[addr_h30]^data_q[15:8]),(h3[addr_h31]^data_q[7:0])}; 
  end*/
  else if(state==`DONE) data_d<={h3[addr_h32],h3[addr_h33]};
end 
end

//temp_s
always@(*)
begin
  if(state==`Shift)begin
     temp_s[0]=h3[4];
     temp_s[1]=h3[8];
     temp_s[2]=h3[9];
     temp_s[3]=h3[12];
  end
  else begin
     temp_s[0]=8'd0;
     temp_s[1]=8'd0;
     temp_s[2]=8'd0;
     temp_s[3]=8'd0;
  end
end

always@(*)
begin
if(en)begin
  case(state)
    `RESET0: next_state=`Roundkey0;
    `Roundkey0: begin
       if(counter_r==2'd0) next_state=`Sub;
       else next_state=`Roundkey1;
     end
     `Roundkey1:begin
       if(counter_r==2'd2) next_state=`Roundkey2;
       else next_state=`Roundkey1;
      end
     `Roundkey2:begin
       if(counter_r==2'd0) next_state=`Sub;
       else next_state=`Roundkey3;
      end
     `Roundkey3:begin
         if(addr_r3==8'd159) next_state=`Add_c;
         else begin
           if(counter_r==2'd2) next_state=`Roundkey2;
           else next_state=`Roundkey3;
         end      
      end
     `Add_c: begin
        next_state=`Sub0;
      end
     `Sub0:begin
          next_state=`Sub;
      end
     `Sub:begin
       if(addr_r3==8'd159)begin
          if(counter_s==1'b1)begin
             if(addr_rcon0==6'd15) next_state=`Shift;
             else next_state=`Sub0;
          end
          else next_state=`Sub;
       end
       else begin
	       if(counter_s==1'b0) next_state=`Sub;
	       else if(addr_r0>8'd1) next_state=`Roundkey2;
	       else next_state=`Roundkey0;  
       end
     end//`Sub 

     `Shift:begin
       if(addr_a[15]==8'd159)   next_state=`Add_r;
       else next_state=`Mix;
     end
     `Mix:begin
        if(addr_m[3]==4'd15&&counter_s==1'b1) next_state=`Add_r;
        else next_state=`Mix;
      end
     `Add_r:begin
        if(addr_a[15]==8'd159)begin
           /*if(counter[15]==8'd0&&counter[14]==8'd0)*/ next_state=`DONE;
           //else   next_state=`Cipher; 
        end
        else next_state=`Sub0;
     end
    `DONE:begin
	  if(counter_done==3'd7)begin
        	if(addr==6'd32) next_state=`RESET0;
			else next_state=`Add_c;
	  end
	  else next_state=`DONE;
	end
	default:next_state=`RESET0;
   endcase
end
end

//done_AES
always@(*)
begin
if(en)begin
  if(state==`DONE) done_AES=1'b1;
  else done_AES=1'b0;
end
end

endmodule
