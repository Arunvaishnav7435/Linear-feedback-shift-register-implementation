module top(
    input clk,                    //on board 16 MHz clock
    output reg clk_divi = 0,      //clock division output for slow clock required to observe the output of LFSR
  output [3:0] count,            //LFSR output
  input [3:0] data,              //data load input
	 input reset,                  //reset
	 input load,                    //load enable
	 output e0, e1, e2,            //for three 7 segement enable
	 output dot,                    //for dot
	 output a, b, c, d, e, f, g     //7 segments
    );

  reg [23:0] num = 0;            //internal counter for clock division
	
  LFSR Design(reset, clk_divi, load, data, count);      //instantiating LFSR
	
  display_7_converter mac2(count, clk, e0, e1, e2, dot, a, b, c, d, e, f, g); //instantiating 7 segment display module
	
	always@(posedge clk)
	begin
		num <= num+1;
		if(num == 24'h000000)
		begin
			clk_divi <= ~clk_divi;
			
		end
    if(num == 24'h0ff_fff)        //clock division
			num <= 0;
	end
endmodule
