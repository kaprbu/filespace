
module halfadder (S,C,x,y);
   input x,y;
   output S,C;
//Instantiate primitive gates
   xor (S,x,y);
   and (C,x,y);
endmodule

module fulladder (S,C,x,y,cin);
   input x,y,cin;
   output S,C;
   wire S1,D1,D2; //Outputs of first XOR and two AND gates 
//Instantiate the halfadder 
    halfadder HA1 (S1,D1,x,y); 
    halfadder HA2 (S,D2,S1,cin);
    or g1(C,D2,D1);
endmodule

module four_bit_adder (S, C4, A, B, Cin);
   input [3:0] A,B;
   input Cin;
   output [3:0] S; 
   output C4;
   wire C1,C2, C3;  //Intermediate carries
//Instantiate the fulladder 
   fulladder  FA0 (S[0],C1,A[0],B[0],Cin);
   fulladder  FA1 (S[1],C2,A[1],B[1],C1);
   fulladder  FA2 (S[2],C3,A[2],B[2],C2); 
   fulladder  FA3 (S[3],C4,A[3],B[3],C3); 
        
endmodule


module addsub(S, C, A, B, M);
   input [3:0] A,B;
   input M;  
   output [3:0] S;  
   output C;
	
   wire [3:0] D;  //Output of XOR gates
	
	xor U0(D[0], B[0], M);
	xor U1(D[1], B[1], M);
	xor U2(D[2], B[2], M);
	xor U3(D[3], B[3], M);
	
	four_bit_adder U4(S, C, A, D, M);

endmodule
