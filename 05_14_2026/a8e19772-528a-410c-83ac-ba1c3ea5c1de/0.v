
module ring_counter(clk, reset, stop, Q);
input clk, reset, stop;
output [7:0] Q;

reg [7:0] Qtemp = 8'b00000001; 

 always @(posedge clk)
    begin
        if (reset)   
            Qtemp = 8'b00000001;  
        else if (stop)
	        Qtemp = ________;  
        else   
            Qtemp = {_______, _________};    
    end
    
    assign Q = Qtemp;
endmodule


module counter(clk, load, stop, data_in, up_down, count);
input clk, up_down;  // clock, count up or down       
input load, stop;   // load counter with the number in dataIn
input [3:0] data_in; //starting number 
output reg [3:0] count = 0;
 
always @(posedge clk) 
begin
  if (load) 
     count = ______;
  else if (stop)
     count = ______;
  else if (up_down) 
    count = _______;
  else
   count = _______;
end	

endmodule


module wof(system_clock, reset, stop, leds, seg0, seg1);
input system_clock, reset, stop;
output [7:0] leds; 
output [7:0] seg0, seg1;

wire clk;
wire [3:0] count;

clkDiv2 U1(system_clock, clk);   // produce slower clock
ring_counter U2(____, _____, _____, ______);  //ring counter
counter U3(_____, _______, _______, ________, ________, ________);  // bidirectional counter
seg_decoder U4(_______, ________);        // the first 7 segment display 
seg_decoder U5(_______, ________);        // the second 7 segment display 
  
endmodule


