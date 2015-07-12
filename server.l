# server.l - OO wrapper for lo_server
#
# The MIT License (MIT)
#
# copyright (c) 2015 Erik Gustafson

[class +OscServer +Entity]
[rel ptr (+Number)]

[dm T (Port ErrHandler)
   (default Port 0 ErrHandler 0)
   (=: ptr
       (liblo~ffi 'lo-server-new
          Port
          ErrHandler ]

# (add-method> Obj
#   '(foo-handler ("foo/" "iiff")
#      (println "Hey! You got a message") ) )
[dm add-method> (Name Path TypeSpec Fun Data)
   (liblo~ffi 'lo-server-add-method
      (: ptr)
      Path
      TypeSpec
      (lisp Name Fun)
      Data ]

[dm get-port> ()
   (liblo~ffi 'lo-server-get-port
      (: ptr) ]

# prettyprint
[dm pp> ()
   (liblo~ffi 'lo-server-pp
      (: ptr) ]

[dm recv> ()
   (liblo~ffi 'lo-server-recv
      (: ptr) ]

[dm recv-noblock> ()
   (liblo~ffi 'lo-server-recv-noblock
      (: ptr) ]
