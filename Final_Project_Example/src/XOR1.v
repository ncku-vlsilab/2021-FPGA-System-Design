
module XOR1(clk,en,plaintext,d,q);

input clk;
input en;
input [15:0] plaintext,d;
output [15:0] q;

reg [15:0] q;

always@(posedge clk)
begin
 if(en) q<=plaintext^d;
end

endmodule