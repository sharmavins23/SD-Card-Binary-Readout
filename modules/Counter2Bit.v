`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Module Name: Counter - 2 Bit
//
// Description: Takes an input clock signal and outputs a 2 bit counter value
//              that overflows consistently.
////////////////////////////////////////////////////////////////////////////////


module Counter2Bit (
    // Inputs
    input clock,
    input [1:0] counterIn,
    // Outputs
    output reg [1:0] counterOut
    );

    always @(posedge clock) begin
        counterOut <= counterIn + 1;
    end
endmodule
