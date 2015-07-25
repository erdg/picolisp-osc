# message.l - OO extentsion for liblo lo_message
#
# The MIT License (MIT)
#
# copyright (c) 2015 Erik Gustafson

(or *Osc (load "liblo.l"))  # load liblo.l if needed

(class +OscMessage +Entity)
(rel ptr (+Number))   # pointer to message

[dm T ()
   (=: ptr
       (liblo~ffi 'lo-message-new) ]

[dm message-free> ()
   (liblo~ffi 'lo-message-free
      (: ptr) ]

[dm message-send> (Addr Path)
   (liblo~ffi 'lo-send-message
      (; Addr ptr) Path (: ptr) ]
      
[dm message-incref> ()
   (liblo~ffi 
      'lo-message-incref 
      (: ptr) ]

[dm message-add-int32> (N)
   (liblo~ffi
      'lo-message-add-int32
      (: ptr)
      N ] 

[dm message-add-true> ()
   (liblo~ffi
      'lo-message-add-true
      (: ptr) ]

[dm message-add-float> (N)
   (liblo~ffi
      'lo-message-add-float
      (: ptr)
      (cons N -1.0) ]

[dm message-get-types> ()
   (liblo~ffi
      'lo-message-get-types
      (: ptr) ]

[dm message-pretty> ()
   (liblo~ffi
      'lo-message-pp
      (: ptr) ]
