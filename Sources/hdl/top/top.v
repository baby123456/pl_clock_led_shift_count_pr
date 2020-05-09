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
      .maxihpm0_lpd_aclk(pl_clk),             // input wire maxihpm0_lpd_aclk
      .maxigp2_awready(1'b0),                 // input wire maxigp2_awready
      .maxigp2_wready(1'b0),                  // input wire maxigp2_wready
      // input wire [15 : 0] maxigp2_bid
      .maxigp2_bid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),              
      .maxigp2_bresp({1'b0,1'b0}),            // input wire [1 : 0] maxigp2_bresp
      .maxigp2_bvalid(1'b0),                  // input wire maxigp2_bvalid
      .maxigp2_arready(1'b0),                 // input wire maxigp2_arready
      // input wire [15 : 0] maxigp2_rid
      .maxigp2_rid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),             
      // input wire [127 : 0] maxigp2_rdata
      .maxigp2_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),          
      .maxigp2_rresp({1'b0,1'b0}),            // input wire [1 : 0] maxigp2_rresp
      .maxigp2_rlast(1'b0),                   // input wire maxigp2_rlast
      .maxigp2_rvalid(1'b0),                  // input wire maxigp2_rvalid
      .pl_resetn0(pl_resetn),                 // output wire pl_resetn0
      .pl_clk0(pl_clk)                        // output wire pl_clk0
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

(* X_CORE_INFO = "zynq_ultra_ps_e_v3_0_1_zynq_ultra_ps_e,Vivado 2017.2" *)
module zynq_ultra_ps_e_0(maxihpm0_lpd_aclk, maxigp2_awid, 
   maxigp2_awaddr, maxigp2_awlen, maxigp2_awsize, maxigp2_awburst, maxigp2_awlock, 
   maxigp2_awcache, maxigp2_awprot, maxigp2_awvalid, maxigp2_awuser, maxigp2_awready, 
   maxigp2_wdata, maxigp2_wstrb, maxigp2_wlast, maxigp2_wvalid, maxigp2_wready, maxigp2_bid, 
   maxigp2_bresp, maxigp2_bvalid, maxigp2_bready, maxigp2_arid, maxigp2_araddr, maxigp2_arlen, 
   maxigp2_arsize, maxigp2_arburst, maxigp2_arlock, maxigp2_arcache, maxigp2_arprot, 
   maxigp2_arvalid, maxigp2_aruser, maxigp2_arready, maxigp2_rid, maxigp2_rdata, 
   maxigp2_rresp, maxigp2_rlast, maxigp2_rvalid, maxigp2_rready, maxigp2_awqos, maxigp2_arqos, 
   pl_resetn0, pl_clk0)
   /* synthesis syn_black_box black_box_pad_pin="maxihpm0_lpd_aclk,maxigp2_awid[15:0],maxigp2_awaddr[39:0],maxigp2_awlen[7:0],maxigp2_awsize[2:0],maxigp2_awburst[1:0],maxigp2_awlock,maxigp2_awcache[3:0],maxigp2_awprot[2:0],maxigp2_awvalid,maxigp2_awuser[15:0],maxigp2_awready,maxigp2_wdata[127:0],maxigp2_wstrb[15:0],maxigp2_wlast,maxigp2_wvalid,maxigp2_wready,maxigp2_bid[15:0],maxigp2_bresp[1:0],maxigp2_bvalid,maxigp2_bready,maxigp2_arid[15:0],maxigp2_araddr[39:0],maxigp2_arlen[7:0],maxigp2_arsize[2:0],maxigp2_arburst[1:0],maxigp2_arlock,maxigp2_arcache[3:0],maxigp2_arprot[2:0],maxigp2_arvalid,maxigp2_aruser[15:0],maxigp2_arready,maxigp2_rid[15:0],maxigp2_rdata[127:0],maxigp2_rresp[1:0],maxigp2_rlast,maxigp2_rvalid,maxigp2_rready,maxigp2_awqos[3:0],maxigp2_arqos[3:0],pl_resetn0,pl_clk0" */;
   input maxihpm0_lpd_aclk;
   output [15:0]maxigp2_awid;
   output [39:0]maxigp2_awaddr;
   output [7:0]maxigp2_awlen;
   output [2:0]maxigp2_awsize;
   output [1:0]maxigp2_awburst;
   output maxigp2_awlock;
   output [3:0]maxigp2_awcache;
   output [2:0]maxigp2_awprot;
   output maxigp2_awvalid;
   output [15:0]maxigp2_awuser;
   input maxigp2_awready;
   output [127:0]maxigp2_wdata;
   output [15:0]maxigp2_wstrb;
   output maxigp2_wlast;
   output maxigp2_wvalid;
   input maxigp2_wready;
   input [15:0]maxigp2_bid;
   input [1:0]maxigp2_bresp;
   input maxigp2_bvalid;
   output maxigp2_bready;
   output [15:0]maxigp2_arid;
   output [39:0]maxigp2_araddr;
   output [7:0]maxigp2_arlen;
   output [2:0]maxigp2_arsize;
   output [1:0]maxigp2_arburst;
   output maxigp2_arlock;
   output [3:0]maxigp2_arcache;
   output [2:0]maxigp2_arprot;
   output maxigp2_arvalid;
   output [15:0]maxigp2_aruser;
   input maxigp2_arready;
   input [15:0]maxigp2_rid;
   input [127:0]maxigp2_rdata;
   input [1:0]maxigp2_rresp;
   input maxigp2_rlast;
   input maxigp2_rvalid;
   output maxigp2_rready;
   output [3:0]maxigp2_awqos;
   output [3:0]maxigp2_arqos;
   output pl_resetn0;
   output pl_clk0;
endmodule
