//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class can be used to provide stimulus when an interface
//              has been configured to run in a responder mode. It
//              will never finish by default, always going back to the driver
//              and driver BFM for the next transaction with which to respond.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class imem_responder_sequence 
  extends imem_sequence_base ;

  `uvm_object_utils( imem_responder_sequence )

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  bit instrmem_rd;
  imem_transaction temp;
  bit[15:0] new_PC;
  bit[15:0] prev_PC;
  bit [2:0] register; 

bit disable_mem_seq;
  function new(string name = "imem_responder_sequence");
    super.new(name);
    new_PC = 0;
    prev_PC = 0; 
    instrmem_rd = 'b0;
    disable_mem_seq =0;
    temp=imem_transaction::type_id::create("temp");
  endfunction

  task body();
    req=imem_transaction::type_id::create("req");
    rsp=imem_transaction::type_id::create("rsp");
    start_item(req);
    finish_item(req);
    get_response(req);

    
    //initialize all registers and reset values
    for(int i = 0; i<8; i++)
    begin
      start_item(req);
      register = i;
      req.instr_dout = {LEA, register, 9'b000000000};
      req.complete_instr = 1'b1;
      finish_item(req);
    end
    get_response(rsp);
    start_item(req);

    req.instr_dout = {LEA, 3'b000, 9'b000000000};
    req.complete_instr = 1'b1;
    finish_item(req);

    get_response(req);

    forever begin
      start_item(req);
    
        
        if(!temp.randomize()) `uvm_fatal("SEQ", "imem_random_sequence::body()-imem_transaction randomization failed")
        prev_PC = new_PC;

      temp.complete_instr = 'b1;

      req.do_copy(temp);
      
      finish_item(req);

      get_response(req);
      // new_PC = req.NPC;
      // instrmem_rd = req.instrmem_rd;
      // pragma uvmf custom body begin
      // UVMF_CHANGE_ME : Do something here with the resulting req item.  The
      // finish_item() call above will block until the req transaction is ready
      // to be handled by the responder sequence.
      // If this was an item that required a response, the expectation is
      // that the response should be populated within this transaction now.
      // `uvm_info("IMEM",$sformatf("Imem txn: %s",req.convert2string()),UVM_MEDIUM)
      `uvm_info("SEQ",$sformatf("Processed txn: %s",req.convert2string()),UVM_MEDIUM)
      // pragma uvmf custom body end
      
/*
      repeat(50) begin
         start_item(req);
         if(!req.randomize()) `uvm_fatal("SEQ","randomization failed")
          finish_item(req);
      end
      */
    end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

