module	Reset_Delay(iCLK,oRESET, case1, case2, case3, case4, case5, case6, case7, case8, case9, case10, case11, case12);
input		iCLK;
input		case1, case2, case3, case4, case5, case6, case7, case8, case9, case10, case11, case12;
output reg	oRESET;
reg	[19:0]	Cont;

reg firstCase, secondCase, thirdCase, fourthCase, fifthCase, sixthCase, seventhCase, eighthCase, ninthCase, tenthCase,eleventhCase, twelfthCase;

initial
begin
	firstCase <= 0;
	secondCase <= 0;
	thirdCase <= 0;
	fourthCase <= 0;
	fifthCase <= 0;
	sixthCase <= 0;
	seventhCase <= 0;
	eighthCase <= 0;
	ninthCase <= 0;
	tenthCase <= 0;
	eleventhCase <= 0;
	twelfthCase <= 0;

end

always@(posedge iCLK)
begin
	if(Cont!=20'hFFFFF)
	begin
		Cont	<=	Cont+1;
		oRESET	<=	1'b0;
	end
else
	begin
		if(! oRESET)
			oRESET <= 1;
				if(firstCase != case1)
				begin
					oRESET <= 0;
					firstCase <= case1;
				end
				if(secondCase != case2)
				begin
					oRESET <= 0;
					secondCase <= case2;		
				end
				if(thirdCase != case3)
				begin
					oRESET <= 0;
					thirdCase <= case3;		
				end
				if(fourthCase != case4)
				begin
					oRESET <= 0;
					fourthCase <= case4;		
				end
				if(fifthCase != case5)
				begin
					oRESET <= 0;
					fifthCase <= case5;		
				end
				if(sixthCase != case6)
				begin
					oRESET <= 0;
					sixthCase <= case6;		
				end
				if(seventhCase != case7)
				begin
					oRESET <= 0;
					seventhCase <= case7;		
				end
				if(eighthCase != case8)
				begin
					oRESET <= 0;
					eighthCase <= case8;		
				end
				if(ninthCase != case9)
				begin
					oRESET <= 0;
					ninthCase <= case9;		
				end
				if(tenthCase != case10)
				begin
					oRESET <= 0;
					tenthCase <= case10;		
				end
				if(eleventhCase != case11)
				begin
					oRESET <= 0;
					eleventhCase <= case11;		
				end
				if(twelfthCase != case12)
				begin
					oRESET <= 0;
					twelfthCase <= case12;		
				end
				
		end			
end

endmodule