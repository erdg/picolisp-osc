# server.l - OO wrapper for lo_server
#
# The MIT License (MIT)
#
# copyright (c) 2015 Erik Gustafson

[class +OscServer +Entity]
[rel ptr (+Number)]

#
# constructor method.
#
# : (request +OscServer)
# : (new! '(+OscServer) 6789)
#
[dm T (Port ErrHandler)
   (default Port 0 ErrHandler 0)
   (=: ptr
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
#      '(foo-handler ("foo/" "iiff" X Y)
#         (println "Hey! You got a message" X Y) ) )
#
[dm server-add-method> (Method)
   (let [(Name (Path Types . @Args) @Body) Method]
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
