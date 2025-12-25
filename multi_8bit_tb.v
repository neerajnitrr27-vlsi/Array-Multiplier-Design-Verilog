`timescale 1ns / 1ps
module multi_8bit_tb();
    
  reg [7:0] A,B;
  wire [15:0]P;
  
  multi_8bit UUT(
        .A(A),
        .B(B),
        .P(P)
                );
  initial begin
        // Test cases
        A = 8'b00000000; B = 8'b00000000; #10;
        A = 8'b00000001; B = 8'b00000001; #10;
        A = 8'b00000010; B = 8'b00000011; #10;
        A = 8'b00000100; B = 8'b00000101; #10;
        //A = 00001111; B = 11100011; #10
        //A = 128; B=105; #10;
       
       $finish;
  end
endmodule
