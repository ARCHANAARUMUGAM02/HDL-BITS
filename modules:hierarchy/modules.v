module top_module(
    input wire a, b,
    output wire out
);
    mod_a instance1 (
        .in1(a),      // Connect a to in1
        .in2(b),      // Connect b to in2
        .out(out)     // Connect out
    );
endmodule
