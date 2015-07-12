(class +OscAddress +Entity)
(rel ptr (+Number))

[dm T (Host Port)
   (default Host 0)
   (=: ptr
       (liblo~ffi 'lo-address-new
          Host Port ]

[dm pp> ()
   (liblo~ffi 'lo-address-pp
      (: ptr) ]
