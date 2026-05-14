module seg_decoder(bin, seg);
    input [3:0] bin;    //initializing bin as an 4 bit input signal
    output[7:0] seg;    //initializing seg as an 8 bit output signal
    reg [7:0] seg;      //redeclare seg signal as registers
     
    always @ (bin)      //using the always statement to indicate any change in the bin signal results in evaluating the declared cases
    begin
        case(bin)   //begining the case statement which evaluates the bin value and assigns the appropriate contol signals to our 8bit output signal).
            0: seg = 8'b11000000;   //when bin = 0
            1: seg = 8'b11111001;   //when bin = 1
            2: seg = 8'b10100100;   //when bin = 2
            3: seg = 8'b10110000;   //when bin = 3
            4: seg = 8'b10011001;   //when bin = 4
            5: seg = 8'b10010010;   //when bin = 5
            6: seg = 8'b10000010;   //when bin = 6
            7: seg = 8'b11111000;   //when bin = 7
            8: seg = 8'b10000000;   //when bin = 8
            9: seg = 8'b10010000;   //when bin = 9
			'hA: seg = 8'b10001000;    //when bin = A
			'hb: seg = 8'b10000011;    //when bin = B
			'hC: seg = 8'b11000110;    //when bin = C
			'hd: seg = 8'b10100001;    //when bin = D
			'hE: seg = 8'b10000110;    //when bin = E
			 15: seg = 8'b10001110;    //when bin = F
            default: seg=8'b11111111;   //any other value
        endcase
    end
endmodule