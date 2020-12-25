`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Module Name: Secure Digital Card Binary Readout
//
// Description: Top level module that contains all other individual modules for
//              synthesis.
////////////////////////////////////////////////////////////////////////////////


module SDCardBinaryReadout(
    // Inputs
    input cmosClock,
    // Outputs
    output reg [3:0] sevenSegmentEnable,
    output reg [7:0] sevenSegmentData
    );

    // Module wiring
    wire sevenSegmentClock;
    wire [17:0] sevenSegmentClockDividerCounter;
    wire [1:0] sevenSegmentCounter;

    // Module instantiation
    SevenSegmentClockDivider sevenSegmentClockDivider(
        cmosClock,
        sevenSegmentClock,
        sevenSegmentClockDividerCounter,
        sevenSegmentClock,
        sevenSegmentClockDividerCounter
    );
    Counter2Bit counter2Bit(
        sevenSegmentClock,
        sevenSegmentCounter,
        sevenSegmentCounter
    );

    always @(*) begin
        
    end
endmodule
