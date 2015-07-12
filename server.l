# server.l - OO wrapper for lo_server
#
# The MIT License (MIT)
#
# copyright (c) 2015 Erik Gustafson

[class +LoServer +Entity]
[rel ptr (+Number)]

[dm T (Port ErrHandler)
   (default Port 0 ErrHandler 0)
   (=: ptr
       (osc~ffi 'lo-server-new
          Port
          ErrHandler ]

# (add-method> Obj
#   '(foo-handler ("foo/" "iiff")
#      (println "Hey! You got a message") ) )
[dm add-method> (Name Path TypeSpec Fun Data)
   (osc~ffi 'lo-server-add-method
      (: ptr)
      Path
      TypeSpec
      (lisp (quote Name) Fun)
      Data ]

[dm get-port ()
   (osc~ffi 'lo-server-get-port
      (: ptr) ]

# prettyprint
[dm pp> ()
   (osc~ffi 'lo-server-pp
      (: ptr) ]

[dm recv> ()
   (osc~ffi 'lo-server-recv
      (: ptr) ]

[dm recv-noblock>
   (osc~ffi 'lo-server-recv-noblock
      (: ptr) ]
