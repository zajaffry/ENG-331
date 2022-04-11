module alarm (
  input alarm_set, alarm_stay,
  input [1:0] doors,
  input [2:0] windows,
  output reg secure, alarm
);

  always @* begin
    if( alarm_set ) begin

		if (alarm == 1'b0) begin
			secure <= 1'b1;
		end
		
		else begin	
			secure <= 1'b0;
		end

		if (alarm_stay) begin
		
			if ( (doors[1] == 1'b1) | (doors[0] == 1'b1) | (windows[2] == 1'b1) | (windows[1] == 1'b1)| (windows[0] == 1'b1) ) begin		
				alarm <= 1'b1;
			end
		
		end

		else begin
		
			if ( (windows[2] == 1'b1) | (windows[1] == 1'b1)| (windows[0] == 1'b1) ) begin
				alarm <= 1'b1;
			end
		
		end
	
	end
	
	else begin
		secure <= 1'b0;
		alarm <= 1'b0;
	end

  end

endmodule