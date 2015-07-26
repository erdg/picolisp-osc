# osc.l
#
# The MIT License (MIT)
#
# copyright 2015 (c) Erik Gustafson

(load (pack (car (file)) "liblo.l"))

(class +OscServer +Entity)
(rel ptr (+Number))

#
# constructor method.
#
# : (request +OscServer)
# : (new! '(+OscServer) 6789)
#
[dm T (Port ErrHandler)
   (default Port 0 ErrHandler 0)
   (put> This 'ptr
       (liblo~ffi 'lo-server-new
          (pack Port)
          ErrHandler ]

#
# free server.
#
[dm server-free> ()
   (liblo~ffi 'lo-server-free
      (: ptr) ]

#
# add an OSC method to the specified server.
#
# : (server-add-method> My-Server
#      '(foo-handler ("/foo" "iiff" X Y)
#         (println "Hey! You got a message" X Y) ) )
#
[dm server-add-method> (Method)
   (let [(Name (Path Types . @Args) @Body)  Method]
      (liblo~ffi 'lo-server-add-method
         (: ptr)
         Path
         Types
         (lisp Name (fill '(@Args @Body)))
         0 ]  # change to add user data 

#
# return port number that server has bound to.
#
[dm server-get-port> ()
   (liblo~ffi 'lo-server-get-port
      (: ptr) ]

#
# pretty printing
#
[dm server-pretty> ()
   (liblo~ffi 'lo-server-pp
      (: ptr) ]

#
# block, waiting for an OSC message to be received.
#
[dm server-recv> ()
   (liblo~ffi 'lo-server-recv
      (: ptr) ]

#
# wait for a OSC message to be received.
#
[dm server-recv-noblock> ()
   (liblo~ffi 'lo-server-recv-noblock
      (: ptr) ]



(class +OscAddress +Entity)
(rel ptr (+Number))

[dm T (Host Port)
   (default Host 0)
   (put> This 'ptr
       (liblo~ffi 'lo-address-new
          Host 
          (pack Port) ]

[dm address-free> ()
   (liblo~ffi 'lo-address-free
      (: ptr) ]



(class +OscMessage +Entity)
(rel ptr (+Number))   # pointer to message

[dm T ()
   (put> This 'ptr
       (liblo~ffi 'lo-message-new) ]

[dm message-free> ()
   (liblo~ffi 'lo-message-free
      (: ptr) ]

[dm message-send> (Addr Path)
   (liblo~ffi 'lo-send-message
      (; Addr ptr) 
      Path 
      (: ptr) ]
      
[dm message-incref> ()
   (liblo~ffi 'lo-message-incref 
      (: ptr) ]

[dm message-add-int32> (N)
   (liblo~ffi 'lo-message-add-int32
      (: ptr)
      N ] 

[dm message-add-true> ()
   (liblo~ffi 'lo-message-add-true
      (: ptr) ]

[dm message-add-float> (N)
   (liblo~ffi 'lo-message-add-float
      (: ptr)
      (cons N -1.0) ]

[dm message-get-types> ()
   (liblo~ffi 'lo-message-get-types
      (: ptr) ]

[dm message-pretty> ()
   (liblo~ffi 'lo-message-pp
      (: ptr) ]
