module pes_siso (
  input clk,      // Clock input
  input reset,    // Reset input
  input serial_in, // Serial input
  output reg serial_out // Serial output
);

  reg [3:0] shift_reg; // 4-bit shift register

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      shift_reg <= 4'b0000; // Reset the shift register
    end else begin
      // Shift right, MSB to LSB
      shift_reg <= {serial_in, shift_reg[3:1]}; 
    end
  end

  always @(posedge clk) begin
    serial_out <= shift_reg[0]; // Output the LSB
  end

endmodule
