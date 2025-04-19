`timescale 1ns / 1ps

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Engineer: Ajit Borate
// 
// Create Date: 07.04.2025 20:29:23
// Design Name: Seven Segment Display
// Module Name: seven_segment
// Project Name: seven_segment_0_9
// Target Devices: xc7a35t
// Tool Versions: Vivado v2024.1 (64-bit)
// Description: This verilog module is designed to display digits (0-9) on a 7 segment display using a clock divider.
// Revision: 1.0
// 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// Module to increment and display digit 0-9 on a 7 segment display
module seven_segment(
    input clk,								// Clock input (For Edge Artix 7 50Mhz)
    output reg [6:0] seg,					// Seven Segment display output (A-G segments Active low)
    output reg dp,							// Decimal point control 
    output reg [3:0] an 					// Anode signals for the 4-digit display (Active low)
    );
    
    reg [25:0] counter = 0;					// 26-bit counter for generating  1-second delay
    reg [3:0] digit = 0;					// 4-bit digit value to display (0-9)
	
    // Always block triggered on the rising edge of the clock
    always @(posedge clk) begin
        counter <= counter + 1;				// Incremented counter on every clock cycle
		
		// When counter reaches 50 million (approx 1 second at 50MHz)
        if (counter == 50_000_000) begin	
            counter <= 0;					// Reset the counter 
            digit <= digit + 1;				// Increment digit
			
			// If the digit exceeds 9, wrap it back to 0
            if(digit == 9)
                digit <= 0;      
        end
    end
    
	// Combinational logic to set segment outputs based on the digit value
    always @(*) begin
        dp = 1;								// Turn off the decimal point (active low)
        an = 4'b1111;						// Disable all digits (common anode low-change as needed)
		
		// Select segment pattern for current digit (common cathode encoding)
        case (digit)
            0: seg = 7'b1000000;			// Display 0
            1: seg = 7'b1111001;			// Display 1
            2: seg = 7'b0100100;			// Display 2
            3: seg = 7'b0110000;			// Display 3
            4: seg = 7'b0011001;			// Display 4
            5: seg = 7'b0010010;			// Display 5
            6: seg = 7'b0000010;			// Display 6
            7: seg = 7'b1111000;			// Display 7
            8: seg = 7'b0000000;			// Display 8
            9: seg = 7'b0010000;			// Display 9
            default: seg = 7'b1111111;		// Turn off all segemnts for invalid input
        endcase
    end
    
endmodule
