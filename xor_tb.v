`timescale 1ns/1ns
`include "xor.v"
module xor_tb();

reg a,b;
wire out;

xor_gate G1(a,b,out);

initial begin

$dumpfile("xor_tb.vcd");
$dumpvars(0,xor_tb);

a=0;b=0;  #010;
a=0;b=1;  #010;
a=1;b=0;  #010;
a=1;b=1;  #010;

end

endmodule
