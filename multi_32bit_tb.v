`timescale 1ns / 1ps
module multi_32bit_tb(
);
    reg [31:0] A,B;
    wire [63:0] m;
    
    multi_32bit UUT(
                .A(A),
                .B(B),
                .m(m)
                );
initial begin
   
        A=40429; B=4200; #10;
        A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; #10;
        A = 32'h00000001; B = 32'h00000001; #10;
        A = 32'h00000002; B = 32'h00000003; #10;
        A = 32'h0000FFFF; B = 32'h00000002; #10;
$finish;
end
endmodule

