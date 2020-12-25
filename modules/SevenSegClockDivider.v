`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Module Name: Seven Segment Clock Divider
//
// Description: Takes the input 100MHz clock oscillator signal and divides it to
//              an acceptable value.
////////////////////////////////////////////////////////////////////////////////


module SevenSegClockDivider (
    // Inputs
    input cmosClock,                // Clock input from FPGA pin H4
    input clockIn,                  // Clock input feedback
    input [17:0] counterIn,         // 18 Bit Counter increment
    // Outputs
    output reg clockOut,            // Clock output to circuit
    output reg [17:0] counterOut    // Counter increment output
    );

    // Base counter input
    initial begin
        counterOut = 0;
    end

    // Counter creation for clock division
    always @(posedge cmosClock) begin
        // Iterate counter value
        counterOut <= counterIn + 1;

        // Apply clock flip
        if (counterOut == 0) begin
            clockOut <= ~clockIn;
        end else begin
            clockOut <= clockIn;
        end
        // Counter overflow check guarantees 2^N clock cycles before swap
    end
endmodule