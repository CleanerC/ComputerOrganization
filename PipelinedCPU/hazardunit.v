module hazardunit( ,Oneregwrite,Tworegwrite,TwoAhead[4:0],IFPC[31:0], WBdst[4:0],read1[4:0], read2[4:0] , MEM_Control, 
                                        PCWrite,HazardMux, NEXTPC[31:0]);

	output 	reg  PCWrite, HazardMux;
	output reg [31:0]NEXTPC;
	input MEM_Control, Tworegwrite,Oneregwrite ; 
	input [4:0]WBdst,TwoAhead,read1, read2;
	input [31:0]IFPC;
	
	always@(*) begin
	if(  (read1 != 0 && read2 != 0 & WBdst != 0) && 
	 ( (MEM_Control && (read1 == WBdst) || (read2 == WBdst) )
	    || ( Tworegwrite && ((read1 == TwoAhead) || (read2 == TwoAhead)) )  ||
	    (Oneregwrite && ( read1 == WBdst || read2 == WBdst ))) ) begin
	   PCWrite = 1;
	   HazardMux = 1;
	  NEXTPC = IFPC - 31'd1 ;
	end
	else begin
	   PCWrite = 1;
	   HazardMux = 0;
	   NEXTPC = 0;
	end
	end

endmodule
