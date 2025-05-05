//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class records imem transaction information using
//       a covergroup named imem_transaction_cg.  An instance of this
//       coverage component is instantiated in the uvmf_parameterized_agent
//       if the has_coverage flag is set.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

  /* ALU */
  `define ADD  4'd1
  `define AND  4'd5
  `define NOT  4'd9
  /* B, J*/
  `define BR  4'd0
  `define JMP  4'd12
  /* Load, Store*/
  `define LD  4'd2
  `define LDR  4'd6
  `define LDI  4'd10
  `define LEA  4'd14
  `define ST  4'd3
  `define STR  4'd7
  `define STI  4'd11

class imem_transaction_coverage  extends uvm_subscriber #(.T(imem_transaction ));

  `uvm_component_utils( imem_transaction_coverage )

  T coverage_trans;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  // ****************************************************************************
  covergroup imem_transaction_cg;
    // pragma uvmf custom covergroup begin
    // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
    option.auto_bin_max=1024;
    option.per_instance=1;
    optype: coverpoint coverage_trans.optype{
      bins add_bin = {4'd1}; // create separate bins for each valid opcode
      bins and_bin = {4'd5};
      bins not_bin = {4'd9};
      bins ld_bin  = {4'd2};
      bins ldr_bin = {4'd6};
      bins ldi_bin = {4'd10};
      bins lea_bin = {4'd14};
      bins st_bin  = {4'd3};
      bins str_bin = {4'd7};
      bins sti_bin = {4'd11};
      bins br_bin  = {4'd0};
      bins jmp_bin = {4'd12};
      illegal_bins other = {4'd4, 4'd8, 4'd13, 4'd15}; // invalid instructions
    }
    sr1: coverpoint coverage_trans.sr1;
    sr2: coverpoint coverage_trans.sr2;
    dr: coverpoint coverage_trans.dr;
    mode: coverpoint coverage_trans.mode;
    baser: coverpoint coverage_trans.baser;
    pcoffset9: coverpoint coverage_trans.pcoffset9 {bins range[10] = {[0:$]};} // creates 10 bins for values 0 to maximum possible value
    pcoffset6: coverpoint coverage_trans.pcoffset6 {bins range[10] = {[0:$]};}
    imm5: coverpoint coverage_trans.imm5 {bins range[10] = {[0:$]};}
    nzp: coverpoint coverage_trans.nzp {
      bins range[] = {[0:7]}; // creates automatic bins for given range 
      // illegal_bins zero = {0}; // invalid nzp value at 3'b000
    }
    instr_dout: coverpoint coverage_trans.instr_dout;
    complete_instr: coverpoint coverage_trans.complete_instr;
    instrmem_rd: coverpoint coverage_trans.instrmem_rd;
    PC: coverpoint coverage_trans.PC;
	  // {
		// bins PC_random = {[0:1]};
	  // }
    // pragma uvmf custom covergroup end
  endgroup

  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
    imem_transaction_cg=new;
    // `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that transaction variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")
  endfunction

  // ****************************************************************************
  // FUNCTION : build_phase()
  // This function is the standard UVM build_phase.
  //
  function void build_phase(uvm_phase phase);
    imem_transaction_cg.set_inst_name($sformatf("imem_transaction_cg_%s",get_full_name()));
  endfunction

  // ****************************************************************************
  // FUNCTION: write (T t)
  // This function is automatically executed when a transaction arrives on the
  // analysis_export.  It copies values from the variables in the transaction 
  // to local variables used to collect functional coverage.  
  //
  virtual function void write (T t);
    `uvm_info("COV","Received transaction",UVM_HIGH);
    coverage_trans = t;

     coverage_trans = new;
    case(t.instr_dout[15:12])
      4'b0001: begin
        coverage_trans.optype = 4'b0001;
        coverage_trans.dr = t.instr_dout[11:9];
        coverage_trans.sr1 = t.instr_dout[8:6];
        if(t.instr_dout[5]) begin
          coverage_trans.mode = 1'b1;
          coverage_trans.imm5 = t.instr_dout[4:0];
        end
        else begin
          coverage_trans.mode = 1'b0;
          coverage_trans.sr2 = t.instr_dout[2:0];
        end
      end
      4'b0101: begin
        coverage_trans.optype = 4'b0101;
        coverage_trans.dr = t.instr_dout[11:9];
        coverage_trans.sr1 = t.instr_dout[8:6];
        if(t.instr_dout[5]) begin
          coverage_trans.mode = 1'b1;
          coverage_trans.imm5 = t.instr_dout[4:0];
        end
        else begin
          coverage_trans.mode = 1'b0;
          coverage_trans.sr2 = t.instr_dout[2:0];
        end
      end
      4'b1001: begin
        coverage_trans.optype = 4'b1001;
        coverage_trans.dr = t.instr_dout[11:9];
        coverage_trans.sr1 = t.instr_dout[8:6];
      end
      4'b0010: begin
        coverage_trans.optype = 4'b0010;
        coverage_trans.dr = t.instr_dout[11:9];
        coverage_trans.pcoffset9 = t.instr_dout[8:0];
      end
      4'b0110: begin
        coverage_trans.optype = 4'b0110;
        coverage_trans.dr = t.instr_dout[11:9];
        coverage_trans.baser = t.instr_dout[8:6];
        coverage_trans.pcoffset6 = t.instr_dout[5:0];
      end
      4'b1010: begin
        coverage_trans.optype = 4'b1010;
        coverage_trans.dr = t.instr_dout[11:9];
        coverage_trans.pcoffset9 = t.instr_dout[8:0];
      end
      4'b1110: begin
        coverage_trans.optype = 4'b1110;
        coverage_trans.dr = t.instr_dout[11:9];
        coverage_trans.pcoffset9 = t.instr_dout[8:0];
      end
      4'b0011: begin
        coverage_trans.optype = 4'b0011;
        coverage_trans.sr1 = t.instr_dout[11:9];
        coverage_trans.pcoffset9 = t.instr_dout[8:0];
      end
      4'b0111: begin
        coverage_trans.optype = 4'b0111;
        coverage_trans.sr1 = t.instr_dout[11:9];
        coverage_trans.baser = t.instr_dout[8:6];
        coverage_trans.pcoffset6 = t.instr_dout[5:0];
      end
      4'b1011: begin
        coverage_trans.optype = 4'b1011;
        coverage_trans.sr1 = t.instr_dout[11:9];
        coverage_trans.pcoffset9 = t.instr_dout[8:0];
      end
      4'b0000: begin
        coverage_trans.optype = 4'b0000;
        coverage_trans.nzp = t.instr_dout[11:9];
        coverage_trans.pcoffset9 = t.instr_dout[8:0];
      end
      4'b1100: begin
        coverage_trans.optype = 4'b1100;
        coverage_trans.baser = t.instr_dout[8:6];  
      end
      default: begin
        `uvm_fatal("TRANSACTION", "Invalid instruction type")
      end
    endcase

     coverage_trans.instrmem_rd = t.instrmem_rd;
    //  coverage_trans.instrmem_rd = t.PC;
    coverage_trans.instr_dout = t.instr_dout;
    coverage_trans.complete_instr = t.complete_instr;

    imem_transaction_cg.sample();
    
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

