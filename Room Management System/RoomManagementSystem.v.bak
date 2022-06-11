module RoomManagementSystem(
clock_in,
 
reset_clk,
reset_ps2,

LCD_RW, 
LCD_EN, 
LCD_RS, 
LCD_DATA,

CLK,
DAT,

outID_1,
outID_2,
outID_3,
outID_4,
outID_5,
outID_6,
outID_7,
outID_8,

getOut,

led_g,
led_r,
LEDs_red,
LEDs_green 
);


input reset_clk;
input reset_ps2;
input clock_in;


inout CLK;
inout DAT;

reg clock_out1;

reg[7:0]scandata;
reg key1;
reg key2;
reg key3;
reg [7:0]key1_code;
reg [7:0]key2_code;
reg [7:0]key3_code;

reg key1_active_reg;
reg key2_active_reg;
reg key3_active_reg;

reg res;

wire [3:0] key;

output	[7:0] LCD_DATA;
output LCD_RW, LCD_EN, LCD_RS;

reg case1;
reg case2;
reg case3;
reg case4;
reg case5;
reg case6;
reg case7;
reg case8;
reg case9;
reg case10;
reg case11;
reg case12;

reg[3:0] counter;

reg [3:0] inID_1;
reg [3:0] inID_2;
reg [3:0] inID_3;
reg [3:0] inID_4;
reg [3:0] inID_5;
reg [3:0] inID_6;
reg [3:0] inID_7;
reg [3:0] inID_8;
reg [3:0] inID_9;

output [6:0] outID_1;
output [6:0] outID_2;
output [6:0] outID_3;
output [6:0] outID_4;
output [6:0] outID_5;
output [6:0] outID_6;
output [6:0] outID_7;
output [6:0] outID_8;
reg [6:0] outID_9;


reg [35:0] Fixed_ID1 = 36'h202400875;
reg [35:0] Fixed_ID2 = 36'h202400864;
reg [35:0] Fixed_ID3 = 36'h202108375;
reg [35:0] Fixed_ID4 = 36'h202200875;
reg [35:0] Fixed_ID5 = 36'h201509275;

reg [35:0] Admin_ID1 = 36'h201903235;
reg [35:0] Admin_ID2 = 36'h201903583;

reg [35:0] 	new_id_1;
reg [35:0] 	new_id_2;
reg [35:0] 	new_id_3;
	
reg [35:0] enteredID;

parameter INITIAL_STATE = 0;
parameter KEYBOARD_LISTENING = 1;
parameter CHECK_ID = 2;
parameter INVALID_ID = 3;
parameter VALID_ID = 4;
parameter ROOM_FULL = 5;
parameter CHECK_ID_ADMIN = 6;
parameter ADMIN_MODE = 7;
parameter ADMIN_MODE2 = 8;
parameter OVERRIDE_CAP = 9;
parameter ADD_ID = 10;
parameter CONFIRM_CAP = 11;
parameter CHECK_NEW_ID = 12;
parameter ID_EXISTS = 13;
parameter ID_NOT_EXISTS = 14;


reg [3:0] room_capacity  = 4'd2;
reg [3:0] capacity_count = 4'd0;
input getOut;

reg [3:0] state;

output reg led_g;
output reg led_r;
output reg [16:0] LEDs_red = 0;
output reg [7:0] LEDs_green = 1;

integer counterLEDr = 0;
integer counterLEDg = 0;
integer counterLEDs = 0;
integer counter_05s = 0;
integer counter_5s  = 0;
integer counter_1s  = 0;

reg flag1 = 0;
reg flag2 = 0;

//clock divider instance
clock_divider1 div1(
	.clock_in(clock_in),
	.reset(reset_clk),
	.clock_out(clock_out1)
	);
		
	
//LCD instance
LCD_TEST lcd_inst1(

	.iCLK(clock_in),
	.iRST_N(res),
	.LCD_DATA(LCD_DATA),
	.LCD_RW(LCD_RW),
	.LCD_EN(LCD_EN),
	.LCD_RS(LCD_RS),
	.case1(case1),
	.case2(case2),
	.case3(case3),
	.case4(case4),
	.case5(case5),
	.case6(case6),
	.case7(case7),
	.case8(case8),
	.case9(case9),
	.case10(case10),
	.case11(case11),
	.case12(case12),
	.enteredID(enteredID),
	.room_capacity(room_capacity)
	);

//LCD delay
Reset_Delay rd_inst1(
					.iCLK(clock_in),
					.oRESET(res),
					.case1(case1),
					.case2(case2),
					.case3(case3),
					.case4(case4),
					.case5(case5),
					.case6(case6),
					.case7(case7),
					.case8(case8),
					.case9(case9),
					.case10(case10),
					.case11(case11),
					.case12(case12)		
					);


//ps2 instance	
ps2_keyboard ps2key_inst1(
					.iCLK_50(clock_in),
					.sys_clk(clock_in),
					.ps2_clk(CLK),
					.reset(reset_ps2),
					.reset1(reset_ps2),
					.ps2_dat(DAT),
					.scandata(scandata),
					.key1_on(key1),
					.key2_on(key2),
					.key3_on(key3),
					.key1_code(key1_code),
					.key2_code(key2_code),
					.key3_code(key3_code)
					);
					
convert conv_int1(
			.in(key1_code),
			.out(key)
			);					
					
//BCD to 7-segment instances           
BCD_7seg inst1 (
.in(inID_1),
.out(outID_1)
);


BCD_7seg inst2 (
.in(inID_2),
.out(outID_2)
); 


BCD_7seg inst3 (
.in(inID_3),
.out(outID_3)
);


BCD_7seg inst4 (
.in(inID_4),
.out(outID_4)
); 

BCD_7seg inst5 (
.in(inID_5),
.out(outID_5)
); 

BCD_7seg inst6 (
.in(inID_6),
.out(outID_6)
);

BCD_7seg inst7 (
.in(inID_7),
.out(outID_7)
); 

BCD_7seg inst8 (
.in(inID_8),
.out(outID_8)
); 
									


always @ (posedge clock_in) 
begin
		if(key1_code == 8'h76) begin
			state <= INITIAL_STATE;
			counter 		 = 0;
			enteredID 		 = 0;
			LEDs_red[16:0] 	<= 0;
			LEDs_green[7:0] <= 0;

		end	else 
		begin
			key1_active_reg <= key1;
			key2_active_reg <= key2;
			key3_active_reg <= key3;
		
		case (state)

			INITIAL_STATE : 
			begin
				state 		<= KEYBOARD_LISTENING;
				case1		<= 1; // Disp Enter ID
				case2		<= 0;
				case3		<= 0;
				case4		<= 0;
				case5		<= 0;
				enteredID 	 = 0;
				flag1        = 0;
				flag2		 = 0;
				
			end 
			KEYBOARD_LISTENING: //get ID through keyboard
			begin
			if (key1 && key2 && key3)
				if (key1_code == 8'h14 || key1_code== 8'h11 || key1_code == 8'h1C)
					if (key2_code == 8'h14 || key2_code == 8'h11 || key2_code == 8'h1C)
						if (key3_code == 8'h14 || key3_code == 8'h11 || key3_code == 8'h1C)
							state <= CHECK_ID_ADMIN;
							
					if ((key1_active_reg^key1)&&key1)
					begin
						if(counter<9 && key1_code!=8'h5A)
						begin
						case(counter)
							4'b0000: enteredID[35:32] = key;
							4'b0001: enteredID[31:28] = key;
							4'b0010: enteredID[27:24] = key;
							4'b0011: enteredID[23:20] = key;
							4'b0100: enteredID[19:16] = key;
							4'b0101: enteredID[15:12] = key;
							4'b0110: enteredID[11:8]  = key;
							4'b0111: enteredID[7:4]   = key;
							4'b1000: enteredID[3:0]   = key;
						endcase
						counter = counter + 1;	
						end	
				
						else
						begin if(key1_code == 8'h5A)
							state <= CHECK_ID;
						end
				end			
			end

			CHECK_ID: //check if ID is valid
			begin
				if(enteredID != 0)
				begin
					if((enteredID == Fixed_ID1) || (enteredID == Fixed_ID2) || (enteredID == Fixed_ID3) || (enteredID == Fixed_ID4) || 
					(enteredID == Fixed_ID5) || (enteredID == new_id_1) || (enteredID == new_id_2) || (enteredID == new_id_3))
					begin
						if(capacity_count < room_capacity) //check if room is full
						begin
							flag1 = 1;
							state <= VALID_ID;
						end else
						state <= ROOM_FULL;	
					end else
					state <= INVALID_ID;
				end	
			end
			
			
			INVALID_ID: //entered ID is not valid
			begin
					case1		<= 0; // ID DO not match 
					case2		<= 0;
					case3		<= 1;
					case4		<= 0;
					case5		<= 0;
					
				counterLEDs		<= counterLEDs +1; // blink the LEDs every 0.25s for 5s
				if (counterLEDs == 31'd6249999) 
					begin
						counterLEDs <= 0;
						counter_05s	<= counter_05s +1;
						led_r 		<= ~led_r;
						if (counter_05s == 20)
						begin
							led_r <= 0;
							counter_05s <= 0;
							state <= INITIAL_STATE;
							enteredID 		=  0;
							counter 		=  0;
						end 
					end					
			end
			
			VALID_ID: // entered ID is valid 
			begin
				case1		<= 0; // ID DO not match
				case2		<= 1;
				case3		<= 0;
				case4		<= 0;
				case5		<= 0;
				
				flag2		 = 1;
					
				counterLEDs		<= counterLEDs +1;	//blink the LEDs every 0.5s for 5s
				if (counterLEDs == 31'd12499999)
				begin
					counterLEDs <= 0;
					counter_05s	<= counter_05s +1;
					led_g 		<= ~led_g;
					if (counter_05s == 20)
					begin
						led_g <= 0;
						counter_05s <= 0;
						state <= INITIAL_STATE;
						enteredID =  0;
						counter   =  0;
					end 
				end
				
			end
			
			ROOM_FULL: // room capacity reached
			begin
				case1		<= 0;
				case2		<= 0;
				case3		<= 0;
				case4		<= 1; // room full
				case5		<= 0;
				
				counterLEDs		<= counterLEDs +1;	// blink the LEDs every 0.25s for 5s	
				if (counterLEDs == 31'd6249999)
				begin
					counterLEDs <= 0;
					counter_05s	<= counter_05s +1;
					led_r 		<= ~led_r;
					if (counter_05s == 20)
					begin
						led_r <= 0;
						counter_05s <= 0;
						state <= INITIAL_STATE;
						enteredID 		=  0;
						counter 		=  0;
					end 
				end							
			end
			
			CHECK_ID_ADMIN: //check admin's ID inputted through keyboard
			begin
				if ((key1_active_reg^key1)&&key1)
					begin
						if(counter<10 && key1_code!=8'h5A && key1_code!=8'h1C && key1_code!=8'h11 && key1_code!=8'h14 
						&& key2_code!=8'h1C && key2_code!=8'h11 && key2_code!=8'h14 && key3_code!=8'h1C && key3_code!=8'h11 && key3_code!=8'h14)
						begin
						case(counter)
							4'b0001: enteredID[35:32] = key;
							4'b0010: enteredID[31:28] = key;
							4'b0011: enteredID[27:24] = key;
							4'b0100: enteredID[23:20] = key;
							4'b0101: enteredID[19:16] = key;
							4'b0110: enteredID[15:12] = key;
							4'b0111: enteredID[11:8]  = key;
							4'b1000: enteredID[7:4]   = key;
							4'b1001: enteredID[3:0]   = key;
						endcase
						counter = counter + 1;
							
						end	else if(key1_code == 8'h5A)
						begin
							if(enteredID != 0)
								if ((enteredID == Admin_ID1) || (enteredID == Admin_ID2)) // check admin ID
								begin
									case1		<= 0; 
									case2		<= 0;
									case3		<= 0;
									case4		<= 0;
									case5		<= 1;
									
									state <= ADMIN_MODE;
									enteredID = 0;
									counter = 0;	
								end else state <= INITIAL_STATE; // wrong admin ID
							end					
					end
			end
			
			
			ADMIN_MODE: //valid admin ID
			begin
				counterLEDs	<= 	counterLEDs + 1; // blink the green and red LEDs in a certain pattern
				if(counterLEDs == 31'd6249999) 
				begin
					counterLEDs 	<= 0;
					counter_05s 	<= counter_05s + 1;
					LEDs_red[16:0] 	<= ~LEDs_red[16:0];
					led_r 			= LEDs_red[16];
					LEDs_green[7:0] <= ~LEDs_green[7:0];
					led_g 			= LEDs_green[7];
						
					if (counter_05s == 20)
					begin
						counter_05s    <= 0;
						LEDs_red[16:0] <= 0;
						led_r 		   <= 0;
						LEDs_green[7:0]<= 0;
						led_g 		   <= 0;
						state <= ADMIN_MODE2;	 
					end 
				end		

			end
			
			ADMIN_MODE2: // check the admin option
			begin
				LEDs_red[16:0] <= 0;
				LEDs_green[7:0]<= 0;
				case1		<= 0; 
				case2		<= 0;
				case3		<= 0;
				case4		<= 0;
				case5		<= 0;
				case6		<= 1;
				
				if(key1_code == 8'h16)
				begin 
					state <= OVERRIDE_CAP;
				end	
					
				else if(key1_code == 8'h1E)
					state <= ADD_ID;
							
			end
			
			OVERRIDE_CAP: // override the capacity entered through keyboard
			begin
				case6		<= 0;
				case7		<= 1;
				if ((key1_active_reg^key1)&&key1)
				begin
					if(counter<1 && key1_code!=8'h5A)
					begin
					case(counter)
						1'b0: room_capacity[3:0] = key;
					endcase
					counter = counter + 1;
						
					end	else if(key1_code == 8'h5A)
						state <= CONFIRM_CAP;								
				end
			end
			
			CONFIRM_CAP: // confirm capacity override by pressing enter
			begin
				case7 	<= 0;
				case8 	<= 1;
				
				if ((key1_active_reg^key1)&&key1)
				begin	
					if(key1_code == 8'h5A)
					state <= INITIAL_STATE;		
				end
			end
			
						
			ADD_ID: // add new ID through keyboard
			begin
				case6 <= 0;
				case7 <= 0;
				case8 <= 0;
				case9 <= 1;
				
				if ((key1_active_reg^key1)&&key1)
					begin
						if(counter<9 && key1_code!=8'h5A)
						begin
						case(counter)
							4'b0000: enteredID[35:32] = key;
							4'b0001: enteredID[31:28] = key;
							4'b0010: enteredID[27:24] = key;
							4'b0011: enteredID[23:20] = key;
							4'b0100: enteredID[19:16] = key;
							4'b0101: enteredID[15:12] = key;
							4'b0110: enteredID[11:8]  = key;
							4'b0111: enteredID[7:4]   = key;
							4'b1000: enteredID[3:0]   = key;
						endcase
						counter = counter + 1;
							
						end	else if(key1_code == 8'h5A)
							state <= CHECK_NEW_ID;
					end			
			end
			
			
			CHECK_NEW_ID: // check if ID exists already
			begin
				if(enteredID != 0)
				begin
					if((enteredID == Fixed_ID1) || (enteredID == Fixed_ID2) || (enteredID == Fixed_ID3) || 
						(enteredID == Fixed_ID4) || (enteredID == Fixed_ID5) || (enteredID == new_id_1) || 
						(enteredID == new_id_2) || (enteredID == new_id_3))
						begin
							case9 <= 0;
							case10<= 1;
							state <= ID_EXISTS;							
						end	
					else state <= ID_NOT_EXISTS;
				end					
			end
			
			ID_EXISTS: // ID exists, enter a new one
			begin
				counter_5s <= counter_5s + 1;
				if(counter_5s == 36'd249999960)
				begin
					counter_5s <= 0;
					case10 <= 0;
					case11 <= 1;
					state <= ADD_ID;
					counter = 0;
					enteredID = 0;
				end				
			end
			
			ID_NOT_EXISTS: // ID does not exit, ID successfully added
			begin
				case6 <= 0;
				case7 <= 0;
				case8 <= 0;
				case9 <= 0;
				case10<= 0;
				case11<= 0;
				case12<= 1;
				
				if(new_id_1 == 0)
					new_id_1 = enteredID;
				else if(new_id_2 == 0)
					new_id_2 = enteredID;	
				else new_id_3 = enteredID;
					
				counter_5s <= counter_5s + 1;
				if(counter_5s == 36'd249999960)
				begin
					counter_5s <= 0;
					enteredID = 0;
					state <= INITIAL_STATE;
				end	
			
			end

			default: state <= INITIAL_STATE;
			endcase

// different options of what can be printed on the 7-segment displays
		
		// prints room capacity, capacity count on first 2 7-seg displays
		// prints the first 7 numbers of the enteredID (due to lack of 7-segments)
		inID_1 = room_capacity[3:0];	
		inID_2 = capacity_count[3:0];
		inID_3 = enteredID[27:24];
		inID_4 = enteredID[23:20];
		inID_5 = enteredID[19:16];
		inID_6 = enteredID[15:12];
		inID_7 = enteredID[11:8];
		inID_8 = enteredID[7:4];
		inID_9 = enteredID[3:0];
		
		// prints the first 8 numbers of enteredID
//		inID_1 = enteredID[35:32];	
//		inID_2 = enteredID[31:28];
//		inID_3 = enteredID[27:24];
//		inID_4 = enteredID[23:20];
//		inID_5 = enteredID[19:16];
//		inID_6 = enteredID[15:12];
//		inID_7 = enteredID[11:8];
//		inID_8 = enteredID[7:4];
//		inID_9 = enteredID[3:0];
		
		end	
end

always @ (posedge clock_out1) // a slower clock for when the "getOut" push button is pressed
begin

	if(flag2 == 1 && getOut == 1) 
		capacity_count = capacity_count + 1;	
		
	else if(flag1 == 1)
		capacity_count = capacity_count - 1;
	
	else;
end




endmodule	