module tb_pes_siso;

  reg clk;             // Clock signal
  reg reset;           // Reset signal
  reg serial_in;       // Serial input
  wire serial_out;     // Serial output

  // Instantiate the SISO shift register module
 pes_siso dut (
    .clk(clk),
    .reset(reset),
    .serial_in(serial_in),
    .serial_out(serial_out)
  );

  // Clock generation (50 MHz clock)
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  // Testbench stimulus
  initial begin
$dumpfile("tb_pes_siso.vcd");
	$dumpvars(0,tb_pes_siso);
    clk = 0;
    reset = 1;      // Reset initially
    // serial_in = 0;  // Set your serial input here (remove this line)

    // Apply reset and serial input
    #10 reset = 0;
   

    // Apply serial input values and check serial output
    $display("Time\tSerial In\tSerial Out");
     begin
      serial_in = 1'b1; // Set serial input
      #10;
      serial_in = 1'b0; // Set serial input
      #10; 
      serial_in = 1'b1; // Set serial input
      #10;
      serial_in = 1'b0; // Set serial input
      #10;
      serial_in = 1'b1; // Set serial input
      #10;
      serial_in = 1'b1; // Set serial input
      #10;
      serial_in = 1'b0; // Set serial input
      #10; 
      serial_in = 1'b1; // Set serial input
      #10;
      serial_in = 1'b0; // Set serial input
      #10;
      serial_in = 1'b1; // Set serial input
      #10;serial_in = 1'b1; // Set serial input
      #10;
      serial_in = 1'b0; // Set serial input
      #10; 
      serial_in = 1'b1; // Set serial input
      #10;
      serial_in = 1'b0; // Set serial input
      #10;
      serial_in = 1'b1; // Set serial input
      #10;// Wait for one clock cycle
      $display("%d\t%d\t%d", $time, serial_in, serial_out);
    end

    $finish; // End simulation
  end


endmodule
