`timescale 1ns / 1ps
module digits(input clk,reset,BJP_FIG,CONG_FIG,NOTA_FIG,input [9:0] BJP_COUNT,NOTA_COUNT,CONG_COUNT,output reg [3:0] ones,tens,hundreds,thousands);

reg [9:0] temp_count = 0;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        ones <= 0;
        tens <= 0;
        hundreds <= 0;
        thousands <= 0;
        temp_count<=0;
    end else begin
        if (BJP_FIG) begin
            temp_count <= BJP_COUNT;
        end else if (CONG_FIG) begin
            temp_count <= CONG_COUNT;
        end else if (NOTA_FIG) begin
            temp_count <= NOTA_COUNT;
        end else begin
            temp_count <= 0;
        end

        ones <= temp_count % 10;
        tens <= (temp_count / 10) % 10;
        hundreds <= (temp_count / 100) % 10;
        thousands <= (temp_count / 1000) % 10;
    end
end

endmodule
