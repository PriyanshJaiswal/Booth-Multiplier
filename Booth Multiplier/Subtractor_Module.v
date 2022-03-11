module subtractor(a,b,sum);
	input [7:0] a,b;
	output [7:0]sum;
	wire [7:0] ib;
	wire cout;
	invert b1(ib[0],b[0]);
	invert b2(ib[1],b[1]);
	invert b3(ib[2],b[2]);
	invert b4(ib[3],b[3]);
	invert b5(ib[4],b[4]);
	invert b6(ib[5],b[5]);
	invert b7(ib[6],b[6]);
	invert b8(ib[7],b[7]);

	wire [7:0] q;
	fa fa1(a[0],ib[0],1'b1,sum[0],q[0]);
	fa fa2(a[1],ib[1],q[0],sum[1],q[1]);
	fa fa3(a[2],ib[2],q[1],sum[2],q[2]);
	fa fa4(a[3],ib[3],q[2],sum[3],q[3]);
	fa fa5(a[4],ib[4],q[3],sum[4],q[4]);
	fa fa6(a[5],ib[5],q[4],sum[5],q[5]);
	fa fa7(a[6],ib[6],q[5],sum[6],q[6]);
	fa fa8(a[7],ib[7],q[6],sum[7],cout);

endmodule