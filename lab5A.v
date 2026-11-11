
module lab5A (
    input wire clk_500hz,
    input wire rst,
    output reg [0:7] leds
);

    reg [3:0] endereco;
    reg [6:0] divisor;

    always @(posedge clk_500hz or posedge rst) begin
        if (rst) begin
            endereco <= 4'd0;
            divisor <= 7'd0;
            leds <= 8'b00000000;
        end
        else begin

            // Divisor de clock: reduz a velocidade da animacao
            if (divisor == 7'd99) begin
                divisor <= 7'd0;

                // Sequencia do coracao
                case (endereco)

                  // Espaco antes do coracao
                 4'd0:  leds <= 8'b00000000;
                 4'd1:  leds <= 8'b00000000;
                 4'd2:  leds <= 8'b00000000;
                 4'd3:  leds <= 8'b00000000;

               // Desenho do coracao
               4'd4:  leds <= 8'b01100110;
               4'd5:  leds <= 8'b11111111;
               4'd6:  leds <= 8'b11111111;
               4'd7:  leds <= 8'b01111110;
               4'd8:  leds <= 8'b00111100;
               4'd9:  leds <= 8'b00011000;

             // Espaco depois do coracao
             4'd10: leds <= 8'b00000000;
             4'd11: leds <= 8'b00000000;
             4'd12: leds <= 8'b00000000;
             4'd13: leds <= 8'b00000000;

             default: leds <= 8'b00000000;

                  

                endcase

                // Reinicia a sequencia
                if (endereco == 4'd15)
                    endereco <= 4'd0;
                else
                    endereco <= endereco + 1'b1;

            end
            else begin
                divisor <= divisor + 1'b1;
            end
        end
    end

endmodule
