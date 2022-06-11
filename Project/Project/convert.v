module convert(
input wire[7:0] in,
output reg[3:0] out
);



always @ (in) begin

case(in)
8'h45: out = 4'h0;
8'h16: out = 4'h1;
8'h1E: out = 4'h2;
8'h26: out = 4'h3;
8'h25: out = 4'h4;
8'h2E: out = 4'h5;
8'h36: out = 4'h6;
8'h3D: out = 4'h7;
8'h3E: out = 4'h8;
8'h46: out = 4'h9;

default: out=4'h0;

endcase

end
endmodule