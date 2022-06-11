module clock_divider1 (
	input  wire clock_in,
	input  wire reset,
	output reg  clock_out
);
	
	reg [31:0] counter;
	
	always @ (posedge clock_in) 
	begin
		if (reset) begin
			counter <= 32'd0;
			clock_out <= 1'b0;
		end else begin 
			counter <= counter + 32'd1;
			
			if (counter == 36'd124999995) 
			begin
				clock_out <= ~clock_out;
				counter <= 32'd0;
			end 
		end 
	end 
	
endmodule

