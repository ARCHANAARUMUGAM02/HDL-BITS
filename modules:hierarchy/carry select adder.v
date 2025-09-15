module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum_low;
    wire [15:0] sum_high0, sum_high1;
    wire carry_low, carry_high0, carry_high1;

    // Lower 16 bits adder (carry-in = 0)
    add16 u0 (
        .a    (a[15:0]),
        .b    (b[15:0]),
        .cin  (1'b0),
        .sum  (sum_low),
        .cout (carry_low)
    );

    // Upper 16 bits adder assuming cin = 0
    add16 u1 (
        .a    (a[31:16]),
        .b    (b[31:16]),
        .cin  (1'b0),
        .sum  (sum_high0),
        .cout (carry_high0)
    );

    // Upper 16 bits adder assuming cin = 1
    add16 u2 (
        .a    (a[31:16]),
        .b    (b[31:16]),
        .cin  (1'b1),
        .sum  (sum_high1),
        .cout (carry_high1)
    );

    // Combine results
    assign sum[15:0]  = sum_low;
    assign sum[31:16] = carry_low ? sum_high1 : sum_high0;

endmodule

