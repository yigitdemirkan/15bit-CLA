// DO NOT CHANGE THE INPUT/OUTPUT NAMES, OTHERWISE WE CAN'T GRADE YOUR SUBMISSION

module CLA_15bit_top (
  input [14:0] A   ,
  input [14:0] B   ,
  input         mode, // 0 --> addition , 1 --> subtraction
  output [14:0] S   ,
  output        Cout,
  output        OVF
);

//decomposing A and B into 5 pieces each to use 3-bit cla's
wire [2:0] A0, A1, A2, A3, A4;
wire [2:0] B0, B1, B2, B3, B4;
assign A0 = A[2:0];
assign A1 = A[5:3];
assign A2 = A[8:6];
assign A3 = A[11:9];
assign A4 = A[14:12];
assign B0 = B[2:0];
assign B1 = B[5:3];
assign B2 = B[8:6];
assign B3 = B[11:9];
assign B4 = B[14:12];

//carries between CLA blocks 
wire C1, C2, C3, C4;

// designing CLAs 
CLA_3bit cla0 (.C(A0), .D(B0), .Cin(mode), .mode(mode), .RES(S[2:0]), .Carry(C1));
CLA_3bit cla1 (.C(A1), .D(B1), .Cin(C1), .mode(mode), .RES(S[5:3]), .Carry(C2));
CLA_3bit cla2 (.C(A2), .D(B2), .Cin(C2), .mode(mode), .RES(S[8:6]), .Carry(C3));
CLA_3bit cla3 (.C(A3), .D(B3), .Cin(C3), .mode(mode), .RES(S[11:9]), .Carry(C4));
CLA_3bit cla4 (.C(A4), .D(B4), .Cin(C4), .mode(mode), .RES(S[14:12]), .Carry(Cout));

//detecting overflow
assign OVF = ( (mode == 0) && ((~A4[2] & ~B4[2] & S[14]) | (A4[2] & B4[2] & ~S[14])) ) || ( (mode == 1) && (( A4[2] & ~B4[2] & ~S[14]) | (~A4[2] & B4[2] & S[14])) );


endmodule 