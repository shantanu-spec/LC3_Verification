//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the fetch_in transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a fetch_in_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class fetch_in_random_sequence 
  extends fetch_in_sequence_base ;

  `uvm_object_utils( fetch_in_random_sequence )

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  //*****************************************************************
  function new(string name = "");
    super.new(name);
  endfunction: new

  // ****************************************************************************
  // TASK : body()
  // This task is automatically executed when this sequence is started using the 
  // start(sequencerHandle) task.
  //
  task body();
  
      // Construct the transaction
      req=fetch_in_transaction::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "fetch_in_random_sequence::body()-fetch_in_transaction randomization failed")
      // Send the transaction to the fetch_in_driver_bfm via the sequencer and fetch_in_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: fetch_in_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

