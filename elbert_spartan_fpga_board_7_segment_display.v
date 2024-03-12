//code to use 7 segment display on Elbert Spartan 3A FPGA board
module display_7_converter(    
	 input [3:0] dec,                                  //decimal value input
	 input clk,                                        //clock to time operations
    output reg e0, e1, e2,                           //enable for chosing 7 segement display out of 3
	 output dot,                                       //to control dot on the 7 segment display
	 output reg a, b, c, d, e, f, g                    //7 segment display segments
    );
	
	assign dot = 1'b1;                                //keeping the dot off for this purpose

//7 segment display is is common anode hence high logic will turn off and low logic will turn on

	always@(posedge clk)
	begin
		{e0, e1, e2} = 3'b110;                           //selecting the first display
		{a, b, c, d, e, f, g} = ~7'd0;                   //to avoid unwanted latching
		case(dec)                                        //displaying based on decimal value
		4'd0 : {a, b, c, d, e, f, g} = ~7'b1111110;      
		4'd1 : {a, b, c, d, e, f, g} = ~7'b0110000;      //7 segment displays are common anode hence inverter ~
		4'd2 : {a, b, c, d, e, f, g} = ~7'b1101101;
		4'd3 : {a, b, c, d, e, f, g} = ~7'b1111001;
		4'd4 : {a, b, c, d, e,  f, g} = ~7'b0110011;
		4'd5 : {a, b, c, d, e, f, g} = ~7'b1011011;
		4'd6 : {a, b, c, d, e, f, g} = ~7'b1011111;
		4'd7 : {a, b, c, d, e, f, g} = ~7'b1110000;
		4'd8 : {a, b, c, d, e, f, g} = ~7'b1111111;
		4'd9 : {a, b, c, d, e, f, g} = ~7'b1111011;
		4'd10 : {a, b, c, d, e, f, g} = ~7'b1110111; //A
		4'd11 : {a, b, c, d, e, f, g} = ~7'b0011111; //b
		4'd12 : {a, b, c, d, e, f, g} = ~7'b1001110; //C
		4'd13 : {a, b, c, d, e, f, g} = ~7'b0111101; //d
		4'd14 : {a, b, c, d, e, f, g} = ~7'b1001111; //E
		4'd15 : {a, b, c, d, e, f, g} = ~7'b1000111; //F
		default : {a, b, c, d, e, f, g} = ~7'd0;          //to avoid unwated latching
		endcase
	end
endmodule
