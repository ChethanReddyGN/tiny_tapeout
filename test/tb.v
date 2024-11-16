`timescale 1ns / 1ps

module alu_top_tb;

    reg [7:0] ui_in;       
    reg [7:0] uio_in;      
    reg clk;               
    reg rst_n;             
    wire [7:0] uo_out;     
    wire [7:0] uio_out;    
    wire [7:0] uio_oe;     

    
    alu_top dut (
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(uio_in),
        .uio_out(uio_out),
        .uio_oe(uio_oe),
        .clk(clk),
        .rst_n(rst_n)
    );

   
    initial begin
        clk = 1;
        forever #5 clk = ~clk;  
    end
   initial begin
   	$dumpfile("alu_top_tb.vcd");
   	$dumpvars();
   	end
    
    initial begin
        
        rst_n = 0; 
        ui_in = 0;
        uio_in = 0;

        
        #10;
        rst_n = 1;

        //Addition
        ui_in = 8'b0001_0010;  
        uio_in = 3'b000;       
        #10;
        
        // Subtraction
        ui_in = 8'b0100_0011;  
        uio_in = 3'b001;       
        #10;

        //Bitwise AND
        ui_in = 8'b1100_1010;  
        uio_in = 3'b010;       
        #10;

        //Bitwise OR
        ui_in = 8'b0110_1001;  
        uio_in = 3'b011;       
        #10;

        //Bitwise XOR
        ui_in = 8'b0111_1000;  
        uio_in = 3'b100;       
        #10;

        // Bitwise NOT
        ui_in = 8'b0101_1101;  
        uio_in = 3'b101;       
        #10;

        //Multiplication
        ui_in = 8'b0011_0010; 
        uio_in = 3'b110;       
        #10;

        // Division (non-zero divisor)
        ui_in = 8'b0010_1000;  
        uio_in = 3'b111;       
        #10;

        // Division by zero
        ui_in = 8'b1001_0000;  
        uio_in = 3'b111;       
        #10; 
        $finish;
    end
endmodule


