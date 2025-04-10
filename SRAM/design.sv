module SRAM (
    input wire clk,        
    input wire rst,       
    input wire [7:0] data_in, 
  	input wire [2:0] addr,    
    input wire cs,          
    input wire re,          
    input wire we,          
    output reg [7:0] data_out 
);

  reg [7:0] mem [7:0]; 

    always @(posedge clk) begin
        if (cs) begin  
            if (rst) begin  
                integer i;
                for (i = 0; i < 8; i = i + 1) begin
                    mem[i] <= 8'b0000_0000; 
//                     data_out <= mem[addr];
                end
              data_out <= 0;
            end
            else if (re && !we) begin 
                data_out <= mem[addr]; 
            end
            else if (we && !re) begin  
                mem[addr] <= data_in;  
            end
        end
    end

endmodule
