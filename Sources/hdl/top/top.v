//////////////////////////////////////////////////////////////////////////////
//  Top-level, static design
//////////////////////////////////////////////////////////////////////////////

module top(
   output [3:0] count_out,   // mapped to general purpose LEDs[4-7]
   output [3:0] shift_out    // mapped to general purpose LEDs[0-3]
);
   reg [34:0]  count;
   wire pl_clk;
   wire pl_resetn;

   // instantiate module shift
   shift inst_shift (
      .en       (pl_resetn),
      .clk      (pl_clk),
      .addr     (count[34:23]),
      .data_out (shift_out) 
   );
 
   // instantiate module count
   count inst_count (
      .rst       (pl_resetn),
      .clk       (pl_clk),
      .count_out (count_out)
   );

   // MAIN

   always @(posedge pl_clk or negedge pl_resetn)
     if (!pl_resetn)
       begin
         count <= 0;
       end
     else
       begin
         count <= count + 1;
       end
zynq_ultra_ps_e_0 zynq_inst (
  .maxihpm0_lpd_aclk(pl_clk),  // input wire maxihpm0_lpd_aclk
  .maxigp2_awready(1'b0),                 // input wire maxigp2_awready
  .maxigp2_wready(1'b0),                  // input wire maxigp2_wready
  // input wire [15 : 0] maxigp2_bid
  .maxigp2_bid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),              
  .maxigp2_bresp({1'b0,1'b0}),            // input wire [1 : 0] maxigp2_bresp
  .maxigp2_bvalid(1'b0),                  // input wire maxigp2_bvalid
  .maxigp2_arready(1'b0),      // input wire maxigp2_arready
   // input wire [15 : 0] maxigp2_rid
  .maxigp2_rid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),             
  // input wire [127 : 0] maxigp2_rdata
  .maxigp2_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),          
  .maxigp2_rresp({1'b0,1'b0}),            // input wire [1 : 0] maxigp2_rresp
  .maxigp2_rlast(1'b0),                   // input wire maxigp2_rlast
  .maxigp2_rvalid(1'b0),                  // input wire maxigp2_rvalid
  .pl_resetn0(pl_resetn),                // output wire pl_resetn0
  .pl_clk0(pl_clk)                       // output wire pl_clk0
);

endmodule

// black box definition for module_shift
module shift(
   input         en,
   input         clk,
   input  [11:0] addr,
   output  [3:0] data_out);
endmodule

// black box definition for module_count
module count(
   input        rst,
   input        clk,
   output [3:0] count_out);
endmodule


