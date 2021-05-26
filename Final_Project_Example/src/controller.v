
`define RESET  4'd0
`define AES    4'd1
`define READ   4'd2
`define XOR1   4'd3
`define WRITE  4'd4
`define GF     4'd5
`define XOR2   4'd6
`define FINISH1 4'd7
`define ARM 4'd8
`define FINISH2 4'd9



module controller(clk,rst,done_AES,done_GF,done_arm,done_arm2,addr,en_memory,en_r,en_w,en_AES,en_XOR1,en_XOR2,en_GF,en_mux,done,addr_h0,state,done2);

input clk,rst;
input done_AES,done_GF,done_arm,done_arm2;
output [5:0] addr;
output en_memory,en_r,en_w,en_AES,/*en_r0,en_r1,en_r2,en_r3,
       en_add_c,en_sub0,en_sub,en_shift,en_mix,en_add_r,*/
	   en_XOR1,en_XOR2,en_GF,done,done2;
output wire en_mux;
output [3:0] addr_h0; 
output [3:0] state;



	   
reg [5:0] addr;
reg en_memory,en_r,en_w,en_AES,en_XOR1,en_XOR2,en_GF,done,done2;	

reg [3:0] state;	
reg [3:0] next_state; 
reg counter_gf; 
reg [3:0] addr_h0; 

assign en_mux=(addr>=6'd32)?1'b0:1'b1;

always@(posedge clk or posedge rst)
begin
  if(rst) state<=`RESET;
  else state<=next_state;
end

//counter_gf
always@(posedge clk)
begin
  if(state==`RESET) counter_gf<=1'b0;
  else if(state==`FINISH1) counter_gf<=1'b0;
  else if(state==`GF&&addr==6'd32&&counter_gf==1'b0&&addr_h0==4'd15&&done==1'b0) counter_gf<=counter_gf+1'b1;
  else if(state==`GF&&addr==6'd40&&counter_gf==1'b0&&addr_h0==4'd15&&done==1'b1) counter_gf<=counter_gf+1'b1;
end

//addr
always@(posedge clk)
begin
  if(state==`RESET||state==`FINISH1) addr<=6'd0;
  else if(done==1'b0)begin
	if(state==`WRITE&&addr<6'd32)begin
		addr<=addr+6'd1;
	end
	else if(state==`READ)begin
		addr<=addr+6'd1;
	end  
	else if(state==`XOR1) addr<=addr-6'd1;  
	else if(state==`GF&&done_GF==1'b1&&addr>=6'd32) addr<=addr+6'd1;
	//else if(state==`GF&&done_GF==1'b1&&addr==6'd40) addr<=6'd0;
	else if(state==`GF&&addr_h0==4'd15&&addr==6'd32&&counter_gf==1'b0) addr<=6'd0; //save_h0
  end
  else begin     
	if(state==`XOR2) addr<=addr+6'd1;
	//else if(state==`GF&&addr==32'd460832) addr<=addr+32'd1;
	else if(state==`WRITE)begin
		if(addr==6'd40)  addr<=6'd0;
		else addr<=addr+6'd1;
	end
  end
end

//addr_h0
always@(posedge clk)
begin
  if(state==`RESET||state==`FINISH1) addr_h0<=4'd0;
  else if(state==`GF&&addr_h0!=4'd15) addr_h0<=addr_h0+4'd1;
end

always@(*)
begin
  case(state)
    `RESET:next_state=`ARM;
	`ARM:begin
	  if(done_arm==1'b1)   next_state=`AES;
	  else next_state=`ARM;
	end
       `AES:begin
	   if(done_AES==1'b1)begin
	     if(done==1'b0)begin
           if(addr==6'd32)next_state=`GF;
           else  next_state=`READ;
		 end
		 else begin
		   if(counter_gf==1'b0)next_state=`GF;
           else  next_state=`READ;
		 end
       end
	   else next_state=`AES;

	end
	`READ:begin
	  if(done==1'b0)begin
		if(counter_gf==1'b0&&addr!=6'd32) next_state=`XOR1;
		else if(counter_gf==1'b0&&addr==6'd32) next_state=`GF;
		else if(counter_gf==1'b1) next_state=`XOR2;
	  end
	  else begin
	    if(counter_gf==1'b1) next_state=`XOR1;
		else/* if(counter_gf==1'b1)*/ next_state=`XOR2;
	  end
	end
	`XOR1: next_state=`WRITE;
	`WRITE:begin
	  if(done==1'b0)begin
		if(counter_gf==1'b1)begin
			if(addr==6'd40) next_state=`FINISH1;
			else next_state=`GF;
		end
		else next_state=`AES;
	  end
	  else begin
	    if(counter_gf==1'b1)begin
			if(addr==6'd31) next_state=`FINISH2;
			else next_state=`AES;
		end
		else next_state=`GF;
	  end	  
	end
	`GF:begin
	 if(addr_h0<4'd15)begin
	  if(addr_h0[0]==1'b1) next_state=`AES;
	  else next_state=`GF;
	 end
	 else begin
	  if(done_GF==1'b1) begin
	    if(addr>=6'd32) next_state=`WRITE;
		else next_state=`READ; 
	  end
	  else next_state=`GF;
	 end
	end
	`XOR2: next_state=`GF;
	`FINISH1:begin
	   if(done_arm2==1'b1) next_state=`AES;
	   else next_state=`FINISH1;	   
	end
	`FINISH2: next_state=`FINISH2;
	
    default:next_state=`RESET;
  endcase
end

always@(*)
begin
  case(state)
   `RESET:begin
     en_memory=1'b0;
	 en_r=1'b0;
	 en_w=1'b0;
	 en_AES=1'b1;
	 en_XOR1=1'b0;
	 en_XOR2=1'b0;
	 en_GF=1'b1;
	 //done=1'b0;
   end
   `ARM:begin
     en_memory=1'b0;
	 en_r=1'b0;
	 en_w=1'b0;
	 en_AES=1'b0;
	 en_XOR1=1'b0;
	 en_XOR2=1'b0;
	 en_GF=1'b0;
	 //done=1'b0;
   end
   `AES:begin
     en_memory=1'b0;
	 en_r=1'b0;
	 en_w=1'b0;
	 en_AES=1'b1;
	 en_XOR1=1'b0;
	 en_XOR2=1'b0;
	 en_GF=1'b0;
	 //done=1'b0;
   end
   `READ:begin
     en_memory=1'b1;
	 en_r=1'b1;
	 en_w=1'b0;
	 en_AES=1'b0;
	 en_XOR1=1'b0;
	 en_XOR2=1'b0;
	 en_GF=1'b0;
	 //done=1'b0;
   end
   `XOR1:begin
     en_memory=1'b0;
	 en_r=1'b0;
	 en_w=1'b0;
	 en_AES=1'b0;
	 en_XOR1=1'b1;
	 en_XOR2=1'b0;
	 en_GF=1'b0;
	 //done=1'b0;
   end
   `WRITE:begin
     en_memory=1'b1;
	 en_r=1'b0;
	 en_w=1'b1;
	 en_AES=1'b0;
	 en_XOR1=1'b0;
	 en_XOR2=1'b0;
	 en_GF=1'b0;
	 //done=1'b0;
   end
   `GF:begin
     en_memory=1'b0;
	 en_r=1'b0;
	 en_w=1'b0;
	 en_AES=1'b0;
	 en_XOR1=1'b0;
	 en_XOR2=1'b0;
	 en_GF=1'b1;
	 //done=1'b0;
   end
   `XOR2:begin
     en_memory=1'b0;
	 en_r=1'b0;
	 en_w=1'b0;
	 en_AES=1'b0;
	 en_XOR1=1'b0;
	 en_XOR2=1'b1;
	 en_GF=1'b0;
	 //done=1'b0;
   end
   `FINISH1:begin
     en_memory=1'b0;
	 en_r=1'b0;
	 en_w=1'b0;
	 en_AES=1'b0;
	 en_XOR1=1'b0;
	 en_XOR2=1'b0;
	 en_GF=(done_arm2)?1'b1:1'b0;
	 //done=1'b1;
   end
   `FINISH2:begin
     en_memory=1'b0;
	 en_r=1'b0;
	 en_w=1'b0;
	 en_AES=1'b0;
	 en_XOR1=1'b0;
	 en_XOR2=1'b0;
	 en_GF=1'b0;
	 //done=1'b1;
   end
 
  endcase
end

always@(posedge clk or posedge rst)
begin
  if(rst) done<=1'b0;
  else if(state==`FINISH1) done<=1'b1;
end


always@(posedge clk or posedge rst)
begin
  if(rst) done2<=1'b0;
  else if(state==`FINISH2) done2<=1'b1;
end
				
endmodule
