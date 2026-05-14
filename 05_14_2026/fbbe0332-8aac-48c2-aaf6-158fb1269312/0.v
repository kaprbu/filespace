// Design: Clock Divider generating 1 Hz clock output from 50 MHz input clock
  
`timescale 1ns / 1ns
module clkDiv2(Clk, ClkOut);

   input Clk;
   output reg ClkOut;
	
 //  parameter DivVal = 25000000;
 parameter DivVal = 1000000;

/*	always @(Div)
	 case (Div)
	    2'b00: DivVal = 25000000;  // 1Hz
		 2'b01: DivVal = 12500000;  // 2Hz
		 2'b10: DivVal = 2500000;  // 10Hz
		 2'b11: DivVal = 1250000;  // 20Hz
		//default: DivVal = 25000000;  // 1Hz
	 endcase
 */
   reg[24:0] DivCnt;
   reg ClkInt;
	
   always @(posedge Clk) begin
        if( DivCnt == DivVal ) begin
            ClkOut <= ~ClkInt;
            ClkInt <= ~ClkInt;
            DivCnt <= 0;
         end
         else begin
            ClkOut <= ClkInt;
            ClkInt <= ClkInt;
            DivCnt <= DivCnt + 1;
         end
   end
endmodule
