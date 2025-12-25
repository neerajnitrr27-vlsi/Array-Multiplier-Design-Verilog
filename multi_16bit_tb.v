`timescale 1ns / 1ps
module multi_16bit_tb();
reg [15:0]A,B;
wire [31:0] P;
multi_16bit UUT(
    .A(A),
    .B(B),
    .P(P)
    );
initial begin
          A = 16'h0001; B = 16'h0001; #10;
          A = 16'h0002; B = 16'h0003; #10;
          A = 16'hFFFF; B = 16'h0001; #10;
          A = 16'hFFFF; B = 16'hFFFF; #10;
          A = 756; B = 139; #10;
          A = 342; B = 939; #10;
$finish;
end
   
endmodule





