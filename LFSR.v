module LFSR(
    input reset, clock, load,  //control signals
  input [3:0] data,            //data input
  output reg [3:0] count       //output
    );
	 
  always@(posedge clock)    //procedural block
    begin
      if(!reset)            //active low reset
        count <= 0;
      else
        begin
          if(!load)         //active low load
            count <= data;  //loading data
          else begin
				count <= count << 1;      //shift register
            count[0] <= count[3] ^ count[2];  //linear feedback
          end
        end
    end
endmodule
