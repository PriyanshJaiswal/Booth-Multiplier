`timescale 1ns/1ns
`include "Basic_Gates.v"
`include "1_bit_FullAdder.v"
`include "Adder_Module.v"
`include "Subtractor_Module.v"


module booth_substep(input wire signed [7:0]a,Q,input wire signed q0,input wire signed [7:0] m,output reg signed [7:0] f8,output reg signed [7:0] l8,output reg cq0);
	wire [7:0] addam,subam;
	Adder myadd(a,m,addam);
	subtractor mysub(a,m,subam);
		always @(*) begin	
		if(Q[0] == q0) begin
			 cq0 = Q[0];
			l8 = Q>>1;
			 l8[7] = a[0];
			 f8 = a>>1;
			if (a[7] == 1)
			f8[7] = 1;
		end

		else if(Q[0] == 1 && q0 ==0) begin
			 cq0 = Q[0];
				l8 = Q>>1;
			 l8[7] = subam[0];
			 f8 = subam>>1;
			if (subam[7] == 1)
			f8[7] = 1;
		end

		else begin
			 cq0 = Q[0];
				l8 = Q>>1;
			 l8[7] = addam[0];
			 f8 = addam>>1;
			if (addam[7] == 1)
			f8[7] = 1;
		end
							
end	
endmodule 




module boothmul(input signed[7:0]a,b,output signed [15:0] c);
	wire signed [7:0]Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
	wire signed [7:0] m;
	wire signed [7:0] A1,A0,A3,A2;
	wire signed [7:0] A4,A5,A6,A7;
	wire signed[7:0] q0;
	wire qout;
	
	booth_substep step1(8'b00000000,a,1'b0,b,A1,Q1,q0[1]);
	booth_substep step2(A1,Q1,q0[1],b,A2,Q2,q0[2]);
	booth_substep step3(A2,Q2,q0[2],b,A3,Q3,q0[3]);
	booth_substep step4(A3,Q3,q0[3],b,A4,Q4,q0[4]);
	booth_substep step5(A4,Q4,q0[4],b,A5,Q5,q0[5]);
	booth_substep step6(A5,Q5,q0[5],b,A6,Q6,q0[6]);
	booth_substep step7(A6,Q6,q0[6],b,A7,Q7,q0[7]);
	booth_substep step8(A7,Q7,q0[7],b,c[15:8],c[7:0],qout);
	
	 
endmodule

module tb;
wire signed [15:0] z;
reg signed [7:0] a,b;


boothmul my_booth(.a(a),.b(b),.c(z));

initial begin 
end

initial
begin
$monitor($time," Multiplication: %d * %d = %d",a,b,z );
a = 8'b11110000;
b = 8'b11110000;

#10

a = 8'b10010101;
b = 8'b100000;

#10

a = 8'b0111;
b = 8'b0;

#10

b = 8'b1;
a = 8'b1;

#10  

a = 8'b00111100;
b = 8'b0101;

#10

a = 8'b10101010;
b = 8'b100011;

#10

a = 8'b010001;
b = 8'b11100;

#10
a = 8'b1000;
b = 8'b10111111;

end
endmodule