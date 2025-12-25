
`timescale 1ns / 1ps
//  Half Adder 
module half_adder (
    input a, b,
    output sum, carry  );
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

//  Full Adder
module full_adder (
    input a, b, cin,
    output sum, carry );
assign sum = a ^ b ^ cin;
assign carry =(a&b)|(b & cin)|(a&cin);
endmodule

module multi_8bit(
    
    input [7:0] A, B,
    output [15:0] P);
 
wire [63:0] pp;// Partial products
wire [55:0] s, c;// Sums and carries
     
genvar i, j;// Declare loop variables
generate
 for(j = 0; j < 8; j = j + 1) begin: row  //B
  for(i = 0; i < 8; i = i + 1) begin: col// A
      assign pp[i + j*8] = A[i] & B[j];
  end
 end
endgenerate

//First column
assign P[0] = pp[0];

//2nd coloumn
half_adder ha1(pp[1],pp[8],s[0],c[0]);
 
//3rd coloumn
full_adder fa1(pp[2],pp[9],c[0],s[1],c[1]);
half_adder ha2(pp[16],s[1],s[2],c[2]);
 
//4th coloumn
full_adder fa2(pp[3],pp[10],c[1],s[3],c[3]);
full_adder fa3(pp[17],s[3],c[2],s[4],c[4]);
half_adder ha3(pp[24],s[4],s[5],c[5]);
 
//5th coloumn
full_adder fa4(pp[4],pp[11],c[3],s[6],c[6]);
full_adder fa5(pp[18],s[6],c[4],s[7],c[7]);
full_adder fa6(pp[25],s[7],c[5],s[8],c[8]);
half_adder ha4(pp[32],s[8],s[9],c[9]);
//6th coloumn
full_adder fa7(pp[5],pp[12],c[6],s[10],c[10]);
full_adder fa8(pp[19],s[10],c[7],s[11],c[11]);
full_adder fa9(pp[26],s[11],c[8],s[12],c[12]);
full_adder fa10(pp[33],s[12],c[9],s[13],c[13]);
half_adder ha5(pp[40],s[13],s[14],c[14]);
//7th coloumn
full_adder fa11(pp[6],pp[13],c[10],s[15],c[15]);
full_adder fa12(pp[20],s[15],c[11],s[16],c[16]);
full_adder fa13(pp[27],s[16],c[12],s[17],c[17]);
full_adder fa14(pp[34],s[17],c[13],s[18],c[18]);
full_adder fa15(pp[41],s[18],c[14],s[19],c[19]);
half_adder ha6(pp[48],s[19],s[20],c[20]);
//8th coloumn
full_adder fa16(pp[7],pp[14],c[15],s[21],c[21]);
full_adder fa17(pp[21],s[21],c[16],s[22],c[22]);
full_adder fa18(pp[28],s[22],c[17],s[23],c[23]);
full_adder fa19(pp[35],s[23],c[18],s[24],c[24]);
full_adder fa20(pp[42],s[24],c[19],s[25],c[25]);
full_adder fa21(pp[49],s[25],c[20],s[26],c[26]);
half_adder ha7(pp[56],s[26],s[27],c[27]);
 
 //9th cloumn
 full_adder fa22(pp[15],c[21],c[22],s[28],c[28]);
 full_adder fa23(pp[22],s[28],c[23],s[29],c[29]);
 full_adder fa24(pp[29],s[29],c[24],s[30],c[30]);
 full_adder fa25(pp[36],s[30],c[25],s[31],c[31]);
 full_adder fa26(pp[43],s[31],c[26],s[32],c[32]);
 full_adder fa27(pp[50],s[32],c[27],s[33],c[33]);
 half_adder ha8(pp[57],s[33],s[34],c[34]);
 //10th cloumn
 full_adder fa28(pp[23],c[28],c[29],s[35],c[35]);
 full_adder fa29(pp[30],s[35],c[30],s[36],c[36]);
 full_adder fa30(pp[37],s[36],c[31],s[37],c[37]);
 full_adder fa31(pp[44],s[37],c[32],s[38],c[38]);
 full_adder fa32(pp[51],s[38],c[33],s[39],c[39]);
 full_adder fa33(pp[58],s[39],c[34],s[40],c[40]);
 //11th coloumn
 full_adder fa34(pp[31],c[35],c[36],s[41],c[41]);
 full_adder fa35(pp[38],s[41],c[37],s[42],c[42]);
 full_adder fa36(pp[45],s[42],c[38],s[43],c[43]);
 full_adder fa37(pp[52],s[43],c[39],s[44],c[44]);
 full_adder fa38(pp[59],s[44],c[40],s[45],c[45]);
 //12th coloumn
 full_adder fa39(pp[39],c[41],c[42],s[46],c[46]);
 full_adder fa40(pp[46],s[46],c[43],s[47],c[47]);
 full_adder fa41(pp[53],s[47],c[44],s[48],c[48]);
 full_adder fa42(pp[60],s[48],c[45],s[49],c[49]);
 
 
 
 //13th coloumn
 full_adder fa43(pp[47],c[46],c[47],s[50],c[50]);
 full_adder fa44(pp[54],s[50],c[48],s[51],c[51]);
 full_adder fa45(pp[61],s[51],c[49],s[52],c[52]);
 //14th coloumn
 full_adder fa46(pp[55],c[50],c[51],s[53],c[53]);
 full_adder fa47(pp[62],s[53],c[52],s[54],c[54]);
 //15th coloumn
 full_adder fa48(pp[63],c[53],c[54],s[55],c[55]);
 // Output Assignments
    assign P[1] = s[0];
    assign P[2] = s[2];
    assign P[3] = s[5];
    assign P[4] = s[9];
    assign P[5] = s[14];
    assign P[6] = s[20];
    assign P[7] = s[27];
    assign P[8] = s[34];
    assign P[9] = s[40];
    assign P[10] = s[45];
    assign P[11] = s[49];
    assign P[12] = s[52];
    assign P[13] = s[54];
    assign P[14] = s[55];
    assign P[15] = c[55];
endmodule





