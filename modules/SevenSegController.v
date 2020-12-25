`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Module Name: Seven Segment Controller
//
// Description: Takes an input clock signal and outputs a 2 bit counter value
//              that overflows consistently.
////////////////////////////////////////////////////////////////////////////////


module SevenSegController (
    // Inputs
    input [1:0] counter,
    input [3:0] nibbleA,
    input [3:0] nibbleB,
    input [3:0] nibbleC,
    input [3:0] nibbleD,
    // Outputs
    output reg [3:0] sevenSegmentEnable,
    output reg [7:0] sevenSegmentData
    );

    // Module wiring
    wire [3:0] enableNibble;
    wire [3:0] dataNibble;

    // Module instantiation
    Mux4Bit4Input mux4Bit4Input();

    always @(counter) begin
endmodule
