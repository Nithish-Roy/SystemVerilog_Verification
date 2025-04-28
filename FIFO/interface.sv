interface fifo#(parameter DATA_WIDTH=8);
  
  logic clk;
  
  bit rst;
  
  logic w_en;
  
  logic r_en;
  
  logic [DATA_WIDTH-1:0] data_in;
  
  logic [DATA_WIDTH-1:0] data_out;
  
  logic full;
  
  logic empty;
  
  
  clocking for_driver @(posedge clk);

	 output rst;
	 output w_en;
	 output r_en;
	 output data_in;

  endclocking

   clocking for_monitor @(posedge clk);
     
//      default output #10;

	 input rst;
	 input w_en;
	 input r_en;
	 input data_in;
	 input data_out;
	 input full;
	 input empty;
	
  endclocking

endinterface
