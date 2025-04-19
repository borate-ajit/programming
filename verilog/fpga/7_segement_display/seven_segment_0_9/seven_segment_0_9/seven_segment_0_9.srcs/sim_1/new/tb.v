`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2025 16:48:26
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb;

    // Inputs
    reg clk;

    // Outputs
    wire [6:0] seg;
    wire dp;
    wire [3:0] an;

    // Instantiate the Unit Under Test (UUT)
    seven_segment uut (
        .clk(clk),   // Connect testbench clk to UUT clk
        .seg(seg),   // 7-segment output
        .dp(dp),     // Decimal point
        .an(an)      // Anode select
    );

    // Clock generation
    initial begin
        clk = 0;
    end

    // Toggle clock every 10 ns → 100 MHz clock
    always #10 clk = ~clk;

    // Simulation time control
    initial begin
        // Display header
        $display("Time(ns)\tDigit\tSeg\tAn\tDP");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, uut.digit, seg, an, dp);
        
        // Run the simulation for a fixed time (simulate for 1 second of actual counter time)
        // Since real counter waits for 50_000_000 clocks, simulating all would take too long.
        // So for practical simulation, override the counter threshold in module OR reduce simulation time here.

        #1_000_000;  // Simulate for 1 millisecond = 1,000,000 ns

        $finish;     // End simulation
    end

endmodule

