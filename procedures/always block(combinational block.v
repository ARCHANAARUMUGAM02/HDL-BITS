module top_module (
    input  a,
    input  b,
    output out_assign,
    output reg out_alwaysblock
);

    // Method 1: assign statement -> wire
    assign out_assign = a & b;   // simple combinational logic

    // Method 2: always @(*) -> reg
    always @(*) begin
        out_alwaysblock = a & b; // same logic
    end

endmodule
