// DO NOT CHANGE THE INPUT/OUTPUT NAMES, OTHERWISE WE CAN'T GRADE YOUR SUBMISSION

module CLA_15bit_tb ();

  reg  [14:0] A, B; // Inputs
  reg   mode; // mode (add or subtract)
  wire [14:0] S   ; // result
  wire        Ovf ; // Outputs are wires.
  wire        Cout;

  CLA_15bit_top dut (A,B,mode,S,Cout,Ovf);// Our design-under-test.

  initial begin
    //  * Our waveform is saved under this file.

    $dumpfile("CLA_15bit_top.vcd");

    // * Get the variables from the module.

    $dumpvars(0,CLA_15bit_tb);

    $display("Simulation started.");

    A = 15'd0;  // Set all inputs to zero.
    B = 15'd0;
    mode = 1'd0;
    #10;     // Wait 10 time units.

    //addition without a carry and without an overflow
    A = 15'd4;
    B = 15'd2;
    mode = 1'd0;
    #10;

    //addition without a carry and with an overflow
    A = 15'd8192;
    B = 15'd8192;
    mode = 1'd0;
    #10;

    //addition with a carry and without an overflow
    A = -15'd8192;
    B = -15'd8192;
    mode = 1'd0;
    #10;

    //addition with a carry and with an overflow
    A = -15'd16384;
    B = -15'd16384;
    mode = 1'd0;
    #10;

    //subtraction without a carry and without an overflow
    A = 15'd4;
    B = -15'd2;
    mode = 1'd1;
    #10;

    //subtraction without a carry and with an overflow
    A = 15'd8192;
    B = -15'd8192;
    mode = 1'd1;
    #10;

    //subtraction with a carry and without an overflow
    A = -15'd8192;
    B = 15'd8192;
    mode = 1'd1;
    #10;

    //subtraction with a carry and with an overflow
    A = -15'd16384;
    B = 15'd16383;
    mode = 1'd1;
    #10;

    $display("Simulation finished.");
    $finish(); // Finish simulation.
  end

endmodule
