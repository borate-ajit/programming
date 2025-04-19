`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ajit Borate
// 
// Create Date: 07.04.2025 20:29:23
// Design Name: Switch LED
// Module Name: switch_led
// Project Name: switch_led
// Target Devices: xc7a35t
// Tool Versions: Vivado v2024.1 (64-bit)
// Description: Control the ON OFF state of the LED using Switch.
// 
// Dependencies: This module is designed to turn an LED ON or OFF based on the state of the switch.
// 
// Revision: 1.0
// 
//////////////////////////////////////////////////////////////////////////////////

// Testbench for the switch led module
module switch_led_tb;

    reg switch_tb;			// Testbench register to simulate the switch input
    wire led_tb;			// Wire to observe the LED output
    integer i;				// Interger variable for loop iteration
    
	// Instantiate the Design Under Test (DUT)
    switch_led DUT (
        .switch(switch_tb),	// Connect testbench switch to DUT's switch
        .led(led_tb)		// Connect testbench LED to DUT's LED
    );
    
	// Initial block to apply test inputs
    initial begin
		// Apply 21 random values to the switch input, with a delay of 10 time unit each
        for (i = 0; i <= 20; i = i+1) begin
            switch_tb = $random();	// Assign a random 1 or 0 to the switch
            #10;					// Wait for 10 time units
        end
      // #1000 $finish;				// End of simulation after 1000 time unit
    end
    
endmodule
