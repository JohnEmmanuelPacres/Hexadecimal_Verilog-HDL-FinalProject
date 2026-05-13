// Structural and Dataflow Modeling
`include "hex_to_7seg_logic.v"

module hex_decoder (
    input [3:0] bin_in,
    input reset,
    output [6:0] seg_tens,
    output [6:0] seg_ones
);

    wire [6:0] logic_tens;
    wire [6:0] logic_ones;

    // Instantiate the behavioral decoder
    hex_to_7seg_logic decoder_inst (
        .bin(bin_in),
        .tens(logic_tens),
        .ones(logic_ones)
    );

    // Apply the reset condition
    assign seg_tens = reset ? 7'b0000000 : logic_tens;
    assign seg_ones = reset ? 7'b0000000 : logic_ones;

endmodule