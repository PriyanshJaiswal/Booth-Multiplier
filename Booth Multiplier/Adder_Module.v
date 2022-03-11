module Adder(a,b,sum);
	input [7:0] a,b;
	output [7:0]sum;
	wire cout;
	wire [7:0] q;
	fa fa1(a[0],b[0],1'b0,sum[0],q[0]);
	fa fa2(a[1],b[1],q[0],sum[1],q[1]);
	fa fa3(a[2],b[2],q[1],sum[2],q[2]);
	fa fa4(a[3],b[3],q[2],sum[3],q[3]);
	fa fa5(a[4],b[4],q[3],sum[4],q[4]);
	fa fa6(a[5],b[5],q[4],sum[5],q[5]);
	fa fa7(a[6],b[6],q[5],sum[6],q[6]);
	fa fa8(a[7],b[7],q[6],sum[7],cout);
	
endmodule