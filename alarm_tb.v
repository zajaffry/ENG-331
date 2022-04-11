module alarm_tb;

  wire alarm_set, alarm_stay;
  wire [1:0] doors;
  wire [2:0] windows;
  wire secure, alarm;

  // reduces typing
  reg [6:0] concat;

  alarm DUT (
    alarm_set,
    alarm_stay,
    doors,
    windows,
    secure,
    alarm
  );

  // break out the value of concat to
  // the input signals
  assign { alarm_set, alarm_stay, doors, windows } = concat;

  initial begin
        concat = 7'b0_0_00_000;
    #10 concat = 7'b1_0_00_000;
    #10 concat = 7'b1_0_01_000;
    #10 concat = 7'b1_0_00_100;
    #10 concat = 7'b1_0_00_101;
    #10 concat = 7'b0_0_00_000;
    #10 concat = 7'b0_1_00_000;
    #10 concat = 7'b1_1_00_000;
    #10 concat = 7'b1_1_01_110;
    #10 concat = 7'b0_0_00_000;
    #10 $stop();
  end

endmodule