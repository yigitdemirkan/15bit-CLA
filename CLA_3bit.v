// DO NOT CHANGE THE INPUT/OUTPUT NAMES, OTHERWISE WE CAN'T GRADE YOUR SUBMISSION

module CLA_3bit (
  input [2:0] C    ,
  input [2:0] D    ,
  input        Cin  ,
  input        mode , // 0 --> addition , 1 --> subtraction
  output [2:0] RES  ,
  output Carry
);

wire [2:0] P,G, D_xor;
assign D_xor = D ^ {3{mode}};
assign P = C ^ D_xor; //propagate signal
assign G = C & D_xor; //generate signal

//computing carries
wire C1,C2,C3; 
assign C1 = G[0] | (P[0] & Cin);
assign C2 = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
assign C3 = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);

//computing sum
assign RES[0] = P[0] ^ Cin;
assign RES[1] = P[1] ^ C1;
assign RES[2] = P[2] ^ C2;


assign Carry = C3;

endmodule 