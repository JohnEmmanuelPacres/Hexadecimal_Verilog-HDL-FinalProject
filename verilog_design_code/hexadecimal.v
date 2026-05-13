module hex_to_7seg_logic (
    input [3:0] hex_in,
    output reg [6:0] tens,
    output reg [6:0] ones
);
    always @(*) begin
        case(bin)
            4'b0000: begin tens = 7'b1111110; ones = 7'b1111110; end // 0
            4'b0001: begin tens = 7'b1111110; ones = 7'b0110000; end // 1
            4'b0010: begin tens = 7'b1111110; ones = 7'b1101101; end // 2
            4'b0011: begin tens = 7'b1111110; ones = 7'b1111001; end // 3
            4'b0100: begin tens = 7'b1111110; ones = 7'b0110011; end // 4
            4'b0101: begin tens = 7'b1111110; ones = 7'b1011011; end // 5
            4'b0110: begin tens = 7'b1111110; ones = 7'b1011111; end // 6
            4'b0111: begin tens = 7'b1111110; ones = 7'b1110000; end // 7
            4'b1000: begin tens = 7'b1111110; ones = 7'b1111111; end // 8
            4'b1001: begin tens = 7'b1111110; ones = 7'b1111011; end // 9
            default: begin tens = 7'b0000000; ones = 7'b0000000; end // Blank for invalid input
        endcase
    end

endmodule