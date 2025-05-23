//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the control_in package.
//   These macros include packed struct definitions.  These structs are
//   used to pass data between classes, hvl, and BFM's, hdl.  Use of 
//   structs are more efficient and simpler to modify.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_struct
//      and from_struct methods defined in the macros below that are used in  
//      the control_in_configuration class.
//
  `define control_in_CONFIGURATION_STRUCT \
typedef struct packed  { \
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } control_in_configuration_s;

  `define control_in_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function control_in_configuration_s to_struct();\
    control_in_configuration_struct = \
       {\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( control_in_configuration_struct );\
  endfunction

  `define control_in_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(control_in_configuration_s control_in_configuration_struct);\
      {\
      this.active_passive,\
      this.initiator_responder  \
      } = control_in_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the control_in_transaction class.
//
  `define control_in_MONITOR_STRUCT typedef struct packed  { \
  bit _complete_data ; \
  bit _complete_instr ; \
  word _IR ; \
  bit [2:0] _NZP ; \
  bit [2:0] _psr ; \
  word _IR_Exec ; \
  word _IMem_dout ; \
     } control_in_monitor_s;

  `define control_in_TO_MONITOR_STRUCT_FUNCTION \
  virtual function control_in_monitor_s to_monitor_struct();\
    control_in_monitor_struct = \
            { \
            this._complete_data , \
            this._complete_instr , \
            this._IR , \
            this._NZP , \
            this._psr , \
            this._IR_Exec , \
            this._IMem_dout  \
            };\
    return ( control_in_monitor_struct);\
  endfunction\

  `define control_in_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(control_in_monitor_s control_in_monitor_struct);\
            {\
            this._complete_data , \
            this._complete_instr , \
            this._IR , \
            this._NZP , \
            this._psr , \
            this._IR_Exec , \
            this._IMem_dout  \
            } = control_in_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the control_in_transaction class.
//      Also update the comments in the driver BFM.
//
  `define control_in_INITIATOR_STRUCT typedef struct packed  { \
  bit _complete_data ; \
  bit _complete_instr ; \
  word _IR ; \
  bit [2:0] _NZP ; \
  bit [2:0] _psr ; \
  word _IR_Exec ; \
  word _IMem_dout ; \
     } control_in_initiator_s;

  `define control_in_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function control_in_initiator_s to_initiator_struct();\
    control_in_initiator_struct = \
           {\
           this._complete_data , \
           this._complete_instr , \
           this._IR , \
           this._NZP , \
           this._psr , \
           this._IR_Exec , \
           this._IMem_dout  \
           };\
    return ( control_in_initiator_struct);\
  endfunction

  `define control_in_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(control_in_initiator_s control_in_initiator_struct);\
           {\
           this._complete_data , \
           this._complete_instr , \
           this._IR , \
           this._NZP , \
           this._psr , \
           this._IR_Exec , \
           this._IMem_dout  \
           } = control_in_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the control_in_transaction class.
//      Also update the comments in the driver BFM.
//
  `define control_in_RESPONDER_STRUCT typedef struct packed  { \
  bit _complete_data ; \
  bit _complete_instr ; \
  word _IR ; \
  bit [2:0] _NZP ; \
  bit [2:0] _psr ; \
  word _IR_Exec ; \
  word _IMem_dout ; \
     } control_in_responder_s;

  `define control_in_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function control_in_responder_s to_responder_struct();\
    control_in_responder_struct = \
           {\
           this._complete_data , \
           this._complete_instr , \
           this._IR , \
           this._NZP , \
           this._psr , \
           this._IR_Exec , \
           this._IMem_dout  \
           };\
    return ( control_in_responder_struct);\
  endfunction

  `define control_in_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(control_in_responder_s control_in_responder_struct);\
           {\
           this._complete_data , \
           this._complete_instr , \
           this._IR , \
           this._NZP , \
           this._psr , \
           this._IR_Exec , \
           this._IMem_dout  \
           } = control_in_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
