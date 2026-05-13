`timescale 1ns / 1ps

module tb_hex_decoder;
    reg [3:0] bin_in;
    reg reset;

    wire [6:0] seg_tens;
    wire [6:0] seg_ones;

    hex_decoder uut (
        .bin_in(bin_in),
        .reset(reset),
        .seg_tens(seg_tens),
        .seg_ones(seg_ones)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_hex_decoder);

        // --- TEST CASE 1: Test the Reset ---
        reset = 1;      // Turn reset ON
        bin_in = 4'b1000; // Put a random number in
        #10;            // Wait 10 nanoseconds

        // --- TEST CASE 2: Count from 0 to F ---
        reset = 0;      // Turn reset OFF
        
        // Loop through all 16 possible hexadecimal values
        for (integer i = 0; i < 16; i = i + 1) begin
            bin_in = i; // Assign the loop counter to our input
            #10;        // Wait 10 nanoseconds for the logic to process
        end

        // End the simulation
        #10;
        $finish;
    end
endmodule