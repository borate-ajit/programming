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
// Description: This module is designed to turn an LED ON or OFF based on the state of the switch.
// Revision: 1.0
// 
//////////////////////////////////////////////////////////////////////////////////


//Module to control an LED using a switch
module switch_led(
    input wire switch,	// Input from the switch 
    output wire led		// Output to the LED
    );
    
	// Assign the value of switch diretly to LED
	// If switch is high, LED is ON; 
	// If switch is low, LED is OFF;
    assign led = switch;
    
endmodule
