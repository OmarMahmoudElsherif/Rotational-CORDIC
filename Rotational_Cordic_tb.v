module Rotational_Cordic_tb();

parameter WORD_LENGTH = 18 ;



reg                    CLK_tb         ;
reg                    RST_tb         ;
reg                    ENABLE_tb      ; 
reg  [WORD_LENGTH-1:0] Xo_tb          ;
reg  [WORD_LENGTH-1:0] Yo_tb          ;
reg  [WORD_LENGTH-1:0] Zo_tb          ;
wire [WORD_LENGTH-1:0] XN_tb          ;
wire [WORD_LENGTH-1:0] YN_tb          ;
wire                   done_signal_tb ;





Rotational_Cordic My_Rotational_Cordic (
	.CLK(CLK_tb),
	.RST(RST_tb),
	.ENABLE(ENABLE_tb),
	.Xo(Xo_tb),
	.Yo(Yo_tb),
	.Zo(Zo_tb),
	.XN(XN_tb),
	.YN(YN_tb),
	.Done(done_signal_tb)
	);



always #5  CLK_tb = !CLK_tb ;   // period = 10 ns



initial begin

// Initialize
	ENABLE_tb=1'b0;
	CLK_tb=1'b0;
	
	

// RST
	RST_tb=1'b1;
	@(posedge CLK_tb)
	RST_tb=1'b0;
	@(posedge CLK_tb)
	RST_tb=1'b1;


// First Trial
	@(posedge CLK_tb)
     ENABLE_tb=1'b1;
	Xo_tb=18'b000000100000000000; // 1
	Yo_tb=18'b000001000000000000; // 2
	Zo_tb='h00c90;// pi/2
	@(posedge CLK_tb)
     ENABLE_tb=1'b0;
     
	 @(done_signal_tb);
	 
	 
	 // Second Trial
	 @(posedge CLK_tb)
     ENABLE_tb=1'b1;
	Xo_tb=18'b000001100000000000; // 3
	Yo_tb=18'b000010000000000000; // 4
	Zo_tb='h3f36f;//- pi/2
	@(posedge CLK_tb)
     ENABLE_tb=1'b0;
     
	 @(done_signal_tb);
     
	 // Third Trial
	 @(posedge CLK_tb)
     ENABLE_tb=1'b1;
	Xo_tb=18'b111110100000000000; // -3
	Yo_tb=18'b000010000000000000; // 4
	Zo_tb='h3f36f;//- pi/2
	@(posedge CLK_tb)
     ENABLE_tb=1'b0;
     
	 @(done_signal_tb);
     
     
     // Fourth Trial
	 @(posedge CLK_tb)
     ENABLE_tb=1'b1;
	Xo_tb=18'b000001100000000000; // 3
	Yo_tb=18'b111110000000000000; // -4
	Zo_tb='h3f36f;//- pi/2
	@(posedge CLK_tb)
     ENABLE_tb=1'b0;
     
	 @(done_signal_tb);
     
	
	 // Fifth Trial
	 @(posedge CLK_tb)
     ENABLE_tb=1'b1; 
    Xo_tb=18'b111110100000000000; // -3
	Yo_tb=18'b111110000000000000; // -4
	Zo_tb='h00c90;// pi/2
	@(posedge CLK_tb)
     ENABLE_tb=1'b0;
     
	 @(done_signal_tb);

	 // 6th Trial
	 @(posedge CLK_tb)
     ENABLE_tb=1'b1; 
    Xo_tb=18'b000001000100110011; // 2.15
	Yo_tb=18'b000000101001100110; // 1.3
	Zo_tb='h01855;// pi-0.1rad
	@(posedge CLK_tb)
     ENABLE_tb=1'b0;
     
	 @(done_signal_tb);

	 // 7th Trial
	 @(posedge CLK_tb)
     ENABLE_tb=1'b1; 
    Xo_tb=18'b000001000100110011; // 2.15
	Yo_tb=18'b000000101001100110; // 1.3
	Zo_tb='h019ee;// pi+0.1rad
	@(posedge CLK_tb)
     ENABLE_tb=1'b0;
     
	 @(done_signal_tb);

	  // 8th Trial
	 @(posedge CLK_tb)
     ENABLE_tb=1'b1; 
    Xo_tb=18'b000001000100110011; // 2.15
	Yo_tb=18'b000000101001100110; // 1.3
	Zo_tb='h03243;// 2*pi
	@(posedge CLK_tb)
     ENABLE_tb=1'b0;
     
	 @(done_signal_tb);

	  // 9th Trial
	 @(posedge CLK_tb)
     ENABLE_tb=1'b1; 
    Xo_tb=18'b000001000100110011; // 2.15
	Yo_tb=18'b000000101001100110; // 1.3
	Zo_tb='h033dd;// 2*pi+0.2
	@(posedge CLK_tb)
     ENABLE_tb=1'b0;
     
	 @(done_signal_tb);

 	// 10th Trial
	 @(posedge CLK_tb)
     ENABLE_tb=1'b1; 
    Xo_tb=18'b000001000100110011; // 2.15
	Yo_tb=18'b000000101001100110; // 1.3
	Zo_tb='h025b2;// 3*pi/2
	@(posedge CLK_tb)
     ENABLE_tb=1'b0;
     
	 @(done_signal_tb);

	 // 11th Trial
	 @(posedge CLK_tb)
     ENABLE_tb=1'b1; 
    Xo_tb=18'b000001000100110011; // 2.15
	Yo_tb=18'b000000101001100110; // 1.3
	Zo_tb='h0267f;// 3*pi/2+0.1
	@(posedge CLK_tb)
     ENABLE_tb=1'b0;
     
	 @(done_signal_tb);

	 // 12th Trial
	 @(posedge CLK_tb)
     ENABLE_tb=1'b1; 
    Xo_tb=18'b000001000100110011; // 2.15
	Yo_tb=18'b000000101001100110; // 1.3
	Zo_tb='h3d980;// -3*pi/2-0.1
	@(posedge CLK_tb)
     ENABLE_tb=1'b0;
     
	 @(done_signal_tb);


	 #50;
	 $stop;

end
endmodule