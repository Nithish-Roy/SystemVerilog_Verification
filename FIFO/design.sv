module synchronous_fifo #(parameter DEPTH = 8, DATA_WIDTH = 8) (
  input  wire clk,
  input  wire rst,
  input  wire w_en,
  input  wire r_en,
  input  wire [DATA_WIDTH-1:0] data_in,
  output reg  [DATA_WIDTH-1:0] data_out,
  output wire full,
  output wire empty
);

  // Local parameters and internal signals
  localparam PTR_WIDTH = $clog2(DEPTH);

  reg [DATA_WIDTH-1:0] fifo_mem [0:DEPTH-1];
  reg [PTR_WIDTH:0] w_ptr, r_ptr; // 1 extra bit for wrap-around
  wire wrap_around;

  integer i;

  // Sequential Logic: Write, Read, and Reset Handling
  always @(posedge clk) begin
    if (rst) begin
      // Reset all pointers and memory
      w_ptr <= 0;
      r_ptr <= 0;
      data_out <= 0;
      for (i = 0; i < DEPTH; i = i + 1)
        fifo_mem[i] <= 0;
    end else begin
      // Write operation
      if (w_en && !full) begin
        fifo_mem[w_ptr[PTR_WIDTH-1:0]] <= data_in;
        w_ptr <= w_ptr + 1;
      end
      
      // Read operation
      if (r_en && !empty) begin
        data_out <= fifo_mem[r_ptr[PTR_WIDTH-1:0]];
        r_ptr <= r_ptr + 1;
      end
    end
  end

  // Combinational Logic: Full and Empty Detection
  assign wrap_around = w_ptr[PTR_WIDTH] ^ r_ptr[PTR_WIDTH];
  assign full  = wrap_around && (w_ptr[PTR_WIDTH-1:0] == r_ptr[PTR_WIDTH-1:0]);
  assign empty = (w_ptr == r_ptr);

endmodule
