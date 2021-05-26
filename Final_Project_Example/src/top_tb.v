//*************************************************                        
//** Author: LPHP Lab                               
//** Project: Simple image processor
//**    			- Top Testbench
//*************************************************


`define input_file_name "pikachu640480.bmp"                    // you should change the input image name by yourself
`define output_file_name "pikachu640480_results.bmp"               // you should change the output image name by yourself
`define size 921664                                    //default size is 480000 pixels
`define width 640                                       //default width is 800 pixels
`define height 480                                      //default height is 600 pixels

/////////////////////////////////////////////////////////
//													   //
//     Do not modify the code bellow this line !!!!!   //
//													   //
/////////////////////////////////////////////////////////

`timescale 1ns/1ps
`define period 10

/*
`include "memory_ctrl.v"
`include "top.v"*/

module top_tb();

  reg clk;
  reg rst;
  reg [7:0] data [`size:0];
  reg [15:0] data1;

  wire [15:0] q;
  wire done,done_arm,done_arm2;
  wire en_memory,en_r,en_w;
  wire [5:0] addr;
  wire [15:0] d;
  wire [3:0] state;
  wire done2;

  
    reg cmd_valid;
	reg 	[7:0]	cmd;
	reg 	[15:0]	data_in;
	reg	[5:0]	address;
	wire 				cmd_done;
	
	wire  [15:0] mem0,mem2;
	wire  [15:0] mem1,mem3;
	wire [15:0] MAC;	
	
	
	

  reg [7:0] tmp;

/*  reg [7:0] Rcon [39:0];
  reg [7:0] SBOX [255:0];
  reg [7:0] counter0 [15:0];
  reg [7:0] CipherKey [15:0];*/

  integer file_handle;
  integer i,j,k,pointer,file_input,file_output;	
  
  top top(.clk(clk),.rst(rst),.q(q),.done(done),.done_arm(done_arm),.done_arm2(done_arm2),.en_memory(en_memory),.en_r(en_r),.en_w(en_w),.addr(addr),.d(d),.state(state),.done2(done2),.MAC(MAC));
  //memory memory(.clk(clk), .en(en_memory), .en_r(en_r), .en_w(en_w), .addr(addr), .d(d), .q(q));

  memory_ctrl memory_ctrl(
	.clk(clk),
	.rst(rst),
	.en(en_memory),
	.addr(addr),
	.d(d),
	.en_r(en_r),
    .en_w(en_w),
	.cmd_valid(cmd_valid),
	.cmd(cmd),
	.data_in(data_in),
	.address(address),
	.cmd_done(cmd_done),
	.q(q),
	.mem0(mem0),
	.mem1(mem1),
	.mem2(mem2),
	.mem3(mem3),
	.done_arm(done_arm),
	.done_arm2(done_arm2)
);


`ifdef syn
initial $sdf_annotate ("top_syn.sdf",top);
`endif

  initial begin
    #(`period*0)
    //file_input = $fopen(`input_file_name,"rb");
    //file_handle = $fopen(`output_file_name,"wb");
    //file_output = $fopen("FPGA_cipher.txt","wb");
    //pointer = $fread(data, file_input);
	/*for(k=0;k<32;k=k+1)begin
	memory.mem[k]={data[2*k],data[2*k+1]};
	end*/
     /* for(k=460827;k<460832;k=k+1)begin
         memory.mem[k]=16'd0;
      end*/
    clk = 1;
    rst = 0;

    #(`period/2)
    rst = 1;

    #(`period/2)

    rst = 0;
  end
  
  always #(`period/2) clk = ~clk;

  /*
  initial begin  
		$readmemh("plaintext.txt", memory.mem);
		
  end	
  */
  /*
  initial begin  

	for(i = 0; i < 40; i = i + 1)
		begin
		  gcm.Rcon[i] = 0;
		end
		  $readmemh("Rcon.txt", gcm.Rcon);
  end	

  initial begin  
	for(i = 0; i < 256; i = i + 1)
		begin
		  gcm.SBOX[i] = 0;
		end
		  $readmemh("SBOX.txt", gcm.SBOX);
   end
*/

  //from the code of 2010 iVCAD
  /*always@(negedge clk)begin
    if(done==1)begin	
 	 for ( i=0 ; i<`size/2 ; i=i+1)begin	   	 
 //       tmp=top.out_mem.mem[i];
          tmp=mem.mem[i];
        if( tmp==0 )begin
          tmp=1;
        end

$fwrite(file_handle,"%c",tmp);
      end
      $fclose(file_handle);
      $finish;		
    end
  end
*/


//photo
/*
always@(negedge clk)
begin
if(done==1)begin

 for(j=0;j<(`size-10)/2;j=j+1)begin
      data1=memory.mem[j];
      $fwrite(file_handle,"%c",data1[15:8]);
      $fwrite(file_handle,"%c",data1[7:0]);
 end
      $fclose(file_handle);
      $finish;
end
end	
*/

initial begin
  $monitor("addr=%d, mem0=%h, mem1=%h, mem2=%h, mem3=%h, done=%d, done2=%d, address=%d, q=%h, cmd=%d, MAC=%h",addr,mem0,mem1,mem2,mem3,done,done2,address,q,cmd,MAC);
   //$monitor("addr=%d, done=%d, done2=%d, data_d[15:8]=%d, data_d[7:0]=%d,gf[15:8]=%d, gf[7:0]=%d, addr_h0=%d, h3=%d, temp_gf=%d",addr,done,done2,data_d[15:8],data_d[7:0],gf[15:8],gf[7:0],addr_h0,h3,temp_gf);
   //$monitor("addr=%d,gf[15:8]=%d, gf[7:0]=%d, addr_h0=%d, temp_gf=%d, state_gf=%d",addr,gf[15:8],gf[7:0],addr_h0,temp_gf,state_gf);
end

initial begin
		    cmd=8'd2; data_in=16'h0001 ; address=6'd0 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;		
		#80 cmd=8'd2; data_in=16'h0203 ; address=6'd1 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h0405 ; address=6'd2 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h0607 ; address=6'd3 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h0809 ; address=6'd4 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h0a0b ; address=6'd5 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h0c0d ; address=6'd6 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h0e0f ; address=6'd7 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		
		#80  cmd=8'd2; data_in=16'h1011 ; address=6'd8 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;		
		#80 cmd=8'd2; data_in=16'h1213 ; address=6'd9 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h1415 ; address=6'd10 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h1617 ; address=6'd11 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h1819 ; address=6'd12 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h1a1b ; address=6'd13 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h1c1d ; address=6'd14 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h1e1f ; address=6'd15 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		
		#80  cmd=8'd2; data_in=16'h2021 ; address=6'd16 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;		
		#80 cmd=8'd2; data_in=16'h2223 ; address=6'd17 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h2425 ; address=6'd18 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h2627 ; address=6'd19 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h2829 ; address=6'd20 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h2a2b ; address=6'd21 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h2c2d ; address=6'd22 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h2e2f ; address=6'd23 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		
		#80  cmd=8'd2; data_in=16'h3031 ; address=6'd24 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;		
		#80 cmd=8'd2; data_in=16'h3233 ; address=6'd25 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h3435 ; address=6'd26 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h3637 ; address=6'd27 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h3839 ; address=6'd28 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h3a3b ; address=6'd29 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h3c3d ; address=6'd30 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80 cmd=8'd2; data_in=16'h3e3f ; address=6'd31 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		
		
		#5000000  cmd=8'd1 ; address=6'd0 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		
		
		for(k=1;k<32;k=k+1)begin
		  #80  cmd=8'd1 ; address=6'd0+k ; cmd_valid = 1'b1 ;
          #40  cmd_valid=1'b0;
		  
		end
		
		for(k=0;k<8;k=k+1)begin
		#80  cmd=8'd1 ; address=6'd33+k ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		
		end
		
		
		#5000000  cmd=8'd1 ; address=6'd0 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		
		
		
		for(k=1;k<40;k=k+1)begin
		  #80  cmd=8'd1 ; address=6'd0+k ; cmd_valid = 1'b1 ;
          #40  cmd_valid=1'b0;
		  
		end
		/*
		#80  cmd=8'd1 ; address=6'd1 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80  cmd=8'd1 ; address=6'd2 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80  cmd=8'd1 ; address=6'd3 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80  cmd=8'd1 ; address=6'd4 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80  cmd=8'd1 ; address=6'd5 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80  cmd=8'd1 ; address=6'd6 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80  cmd=8'd1 ; address=6'd7 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80  cmd=8'd1 ; address=6'd8 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
		#80  cmd=8'd1 ; address=6'd31 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
        #80  cmd=8'd1 ; address=6'd32 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
        #80  cmd=8'd1 ; address=6'd33 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
        #80  cmd=8'd1 ; address=6'd34 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
        #80  cmd=8'd1 ; address=6'd35 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
        #80  cmd=8'd1 ; address=6'd36 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
        #80  cmd=8'd1 ; address=6'd37 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
        #80  cmd=8'd1 ; address=6'd38 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
        #80  cmd=8'd1 ; address=6'd39 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;
        #80  cmd=8'd1 ; address=6'd40 ; cmd_valid = 1'b1 ;
        #40  cmd_valid=1'b0;*/
        
	
		      
    
	end




//txt
/*
always@(negedge clk)
begin
if(done==1)begin

 for(j=0;j<41;j=j+1)begin
      $fwrite(file_output,"%h",memory.mem[j]);
 end
      $fclose(file_output);
      $finish;
end
end	
*/

/*
always@(negedge clk)
begin
if(done==1)begin

 for(j=0;j<256;j=j+1)begin
      $fwrite(file_handle,"%h",gcm.SBOX[j]);
 end
      $fclose(file_handle);
      $finish;
end
end
*/
/*
  initial begin
	`ifdef FSDB
	$fsdbDumpfile("top_tb.fsdb");
	$fsdbDumpvars(0,"+mda");
	`endif
	`ifdef VCD
	$dumpfile("top_tb.vcd");
	$dumpvars;
	`endif
	end
	*/
  initial begin
	#50000000 $finish;
	end

endmodule
