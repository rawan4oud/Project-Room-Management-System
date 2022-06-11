module BCD_7seg(
input wire[3:0] in,
output reg[6:0] out,
output reg a, b, c, d, e, f, g );





always @ (in)
begin


case(in)
0: out= ~7'b1111110;
1: out= ~7'b0110000;
2: out= ~7'b1101101;
3: out= ~7'b1111001;
4: out= ~7'b0110011;
5: out= ~7'b1011011;
6: out= ~7'b1011111;
7: out= ~7'b1110000;
8: out= ~7'b1111111;
9: out= ~7'b1111011;
10: out= ~7'b1110111;
11: out= ~7'b0011111;
12: out= ~7'b1001110;
13: out= ~7'b0111101;
14: out= ~7'b1001111;
15: out= ~7'b1000111;

default: out=~7'b0000000;

endcase

a<=out[6];
b<=out[5];
c<=out[4];
d<=out[3];
e<=out[2];
f<=out[1];
g<=out[0];


end
endmodule
