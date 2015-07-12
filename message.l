# messages.l - OO extentsion for liblo lo_message's
#
# The MIT License (MIT)
#
# copyright (c) 2015 Erik Gustafson

(class +LoMessage +Entity)
(rel ptr (+Number))   # pointer to message

[dm T ()
   (=: ptr
       (osc~ffi 'lo-message-new) ]

[dm send> (Addr Path)
   (osc~ffi 'lo-send-message
      Addr Path (: ptr) ]
      
[dm incref> ()
   (osc~ffi 
      'lo-message-incref 
      (: ptr) ]

[dm add-int32> (N)
   (osc~ffi
      'lo-message-add-int32
      (: ptr)
      N ] 

[dm add-true> ()
   (osc~ffi
      'lo-message-add-true
      (: ptr) ]

[dm add-float> (N)
   (osc~ffi
      'lo-message-add-float
      (: ptr)
      (cons N -1.0) ]

[dm get-types> ()
   (osc~ffi
      'lo-message-get-types
      (: ptr) ]

[dm pp> ()
   (osc~ffi
      'lo-message-pp
      (: ptr) ]
