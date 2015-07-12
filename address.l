(class +LoAddress +Entity)
(rel ptr (+Number))

[dm T (Host Port)
   (default Host 0)
   (=: ptr
       (osc~ffi 'lo-address-new
         Host Port ]

[dm pp> ()
   (osc~ffi 'lo-address-pp
      (: ptr) ]
