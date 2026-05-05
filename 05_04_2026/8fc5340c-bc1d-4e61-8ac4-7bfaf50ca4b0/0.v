module test;
	reg  _____;   // Input
    wire _____;    // Output
    wire _____;    // Output
	
    _____________ // Instantiate the Unit Under Test (UUT)

	initial 
           begin
	         $dumpfile("dump.vcd"); $dumpvars(1, test);  
			 
            // display the inputs and outputs
              $monitor( " x=%d  y=%d seg= %b", ___, ___, ___ );

	       // Initialize Inputs
              x = 0; 
         #10  x = 1; 
		     ……………
			 ……………
			  ……………
		 
         #10 ;
        end
endmodule   
