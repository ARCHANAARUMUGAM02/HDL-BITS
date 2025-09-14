module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
  
    wire [7:0] q1, q2, q3;

    // Instantiate three D flip-flop modules
    my_dff8 u1 (clk, d,  q1);
    my_dff8 u2 (clk, q1, q2);
    my_dff8 u3 (clk, q2, q3);

    // Multiplexer using always block
    always @(*) begin
        case(sel)
            2'b00: q = d;   // Direct input
            2'b01: q = q1;  // After 1st flip-flop
            2'b10: q = q2;  // After 2nd flip-flop
            2'b11: q = q3;  // After 3rd flip-flop
        endcase
    end
endmodule


