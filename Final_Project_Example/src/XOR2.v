
module XOR2(clk,en,cipher,gf,gf_xor);

input clk;
input en;
input [15:0] cipher,gf;
output [15:0] gf_xor;

reg [15:0] gf_xor;

always@(posedge clk)
begin
 if(en) gf_xor<=cipher^gf;
end

endmodule