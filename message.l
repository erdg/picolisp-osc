# messages.l - OO extentsion for liblo lo_message's
#
# The MIT License (MIT)
#
# copyright (c) 2015 Erik Gustafson

(class +OscMessage +Entity)
(rel ptr (+Number))   # pointer to message

[dm T ()
   (=: ptr
       (liblo~ffi 'lo-message-new) ]

[dm send> (Addr Path)
   (liblo~ffi 'lo-send-message
      (; Addr ptr) Path (: ptr) ]
      
[dm incref> ()
   (liblo~ffi 
      'lo-message-incref 
      (: ptr) ]

[dm add-int32> (N)
   (liblo~ffi
      'lo-message-add-int32
      (: ptr)
      N ] 

[dm add-true> ()
   (liblo~ffi
      'lo-message-add-true
      (: ptr) ]

[dm add-float> (N)
   (liblo~ffi
      'lo-message-add-float
      (: ptr)
      (cons N -1.0) ]

[dm get-types> ()
   (liblo~ffi
      'lo-message-get-types
      (: ptr) ]

[dm pp> ()
   (liblo~ffi
      'lo-message-pp
      (: ptr) ]
