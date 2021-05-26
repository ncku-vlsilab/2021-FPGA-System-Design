
module memory(clk,
              en,
			  addr,
			  d,
		  	  en_r,
			  en_w,
              write_enable,
			  data_in,
              address,
			  q,
			  mem0,
			  mem1,
			  mem2,
			  mem3);

// ---------------------- input  ---------------------- //
  input 		clk;
  input 		en;
  input [5:0]	addr;
  input [15:0]	d;
  input 		en_r;
  input 		en_w;
  
  input write_enable;
  input 			[15:0]	data_in;
  input 			[5:0]	address;
  output reg [15:0]   q;
  
  output [15:0] mem0,mem2;
  output [15:0] mem1,mem3;
  
  wire [15:0] mem0=mem[0];
  wire [15:0] mem1=mem[1];
  wire [15:0] mem2=mem[2];
  wire [15:0] mem3=mem[3];

// ----------------------  reg   ---------------------- // 
  reg   [15:0]	mem[41:0];
  
// ----------------------  wire  ---------------------- //




  always @ (posedge clk) begin
    if( (en_r == 1) && (en == 1) ) 
    q <= mem[addr];
	else if( (en_w == 1) && (en == 1)  )
    mem[addr] <= d; 	
	else if(write_enable)begin
	  mem[address] <= data_in;
	end
	else begin
	  q <= mem[address];
	end
	
  end

endmodule
