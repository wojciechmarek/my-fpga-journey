module debouncer (
    input wire i_clk,
    input wire i_rst, // unused
    input wire i_data,
    output reg o_data
);

parameter c_HIGH_PATTERN = 20'b01111111111111111111;
parameter c_LOW_PATTERN = 20'b10000000000000000000;

reg r_IS_HIGH_STABLE = 1'b0;
reg r_IS_LOW_STABLE = 1'b0;
reg [19:0] r_DELAY_SHIFT_HIGH;
reg [19:0] r_DELAY_SHIFT_LOW;
reg r_debounced_data = 1'b0;

always @(posedge i_clk) begin
    r_DELAY_SHIFT_HIGH[19:1] <= r_DELAY_SHIFT_HIGH[18:0];
    r_DELAY_SHIFT_HIGH[0] <= i_data;
    if (r_DELAY_SHIFT_HIGH == c_HIGH_PATTERN) begin
        r_IS_HIGH_STABLE <= 1'b1;
    end
    if (r_debounced_data == 1'b1) begin
        r_IS_HIGH_STABLE <= 1'b0;
    end
end

always @(negedge i_clk) begin
    r_DELAY_SHIFT_LOW[19:1] <= r_DELAY_SHIFT_LOW[18:0];
    r_DELAY_SHIFT_LOW[0] <= i_data;
    if (i_data == 1'b0) begin
        if (r_DELAY_SHIFT_LOW == c_LOW_PATTERN) begin
            r_IS_LOW_STABLE <= r_IS_HIGH_STABLE;
        end
    end
    if (r_debounced_data == 1'b1) begin
        r_IS_LOW_STABLE <= 1'b0;
    end
end

always @(posedge i_clk) begin
    if (r_IS_LOW_STABLE == 1'b1) begin
        r_debounced_data <= 1'b1;
    end else begin
        r_debounced_data <= 1'b0;
    end
end

assign o_data = r_debounced_data;

endmodule