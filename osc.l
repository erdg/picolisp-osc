# osc.l - (native) PicoLisp bindings for liblo
#
# The MIT License (MIT)
#
# copyright (c) 2015 Erik Gustafson


(symbols 'osc 'pico)

(local *Native)
(local ffi chop-ffi ffi-table)

(setq *Osc "liblo.so")

[de chop-ffi (Name)
   (glue "_" (split (chop Name) "-") ]

[de ffi (Fun . @)
   (let Rule (assoc Fun ffi-table)
      (pass native `*Osc (chop-ffi (car Rule)) (eval (cadr Rule) ]

[de ffi-table 
   (lo-send-message         'I)
   (lo-send-message-from    'I)
   (lo-send-bundle          'I)
   (lo-send-bundle-from     'I)
   
# messages
   (lo-message-new          'N)
   (lo-message-incref       NIL)    # lo_message
   (lo-message-clone        'N)     # lo_message
   (lo-message-free         NIL)
   (lo-message-add          'I)
   (lo-message-add-varargs  'I)
   (lo-message-add-int32    'I)
   (lo-message-add-float    'I)
   (lo-message-add-string   'I)
   (lo-message-add-blob     'I)
   (lo-message-add-int64    'I)
   (lo-message-add-timetag  'I)
   (lo-message-add-double   'I)
   (lo-message-add-symbol   'I)
   (lo-message-add-char     'I)
   (lo-message-add-midi     'I)
   (lo-message-add-true     'I)
   (lo-message-add-false    'I)
   (lo-message-add-nil      'I)
   (lo-message-add-infinitum  'I)
   (lo-message-get-source     'N)   # returns pointer to lo_address
   (lo-message-get-timestamp  'N)   # returns pointer to lo_timetag
   (lo-message-get-types    'S)
   (lo-message-get-argc     'I)
   (lo-message-get-argv     'N)     # TEST
   (lo-message-length       'I)     # TEST
   (lo-message-serialize    'N)
   (lo-message-deserialize  'N)
   
# address
   (lo-address-new          'N)
   (lo-address-free         NIL)
   (lo-address-get-hostname 'S)
   (lo-address-get-port     'S)
   (lo-address-get-protocol 'I)
   (lo-address-get-url      'S)
   (lo-address-set-ttl      NIL)
   (lo-address-get-ttl      'I)
   (lo-address-set-iface    'I)
   (lo-address-get-iface    'S)
   (lo-address-set-tcp-nodelay  'I)
   (lo-address-set-stream-slip  'I)
   
# bundles
   (lo-bundle-new           'N)     # lo_timetag
   (lo-bundle-free          NIL)
   (lo-bundle-free-recursive  NIL)
   (lo-bundle-free-messages   NIL)
   (lo-bundle-incref        NIL)
   (lo-bundle-add-message   'I)
   (lo-bundle-add-bundle    'I)
   (lo-bundle-length        'I)
   (lo-bundle-count         'I)
   (lo-bundle-get-type      'I)     # need util function 
   (lo-bundle-get-bundle    'N)
   (lo-bundle-get-message   'N)
   (lo-bundle-get-timetag   'N)
   (lo-bundle-serialize     'N)
   (lo-bundle-deserialize   'N)
   
# utils
   (lo-is-numerical-type    'I)
   (lo-is-string-type       'I)
   (lo-coerce               'I)
   (lo-hires-val            'I)
   (lo-url-get-protocol     'S)
   (lo-url-get-protocol-id  'I)
   (lo-url-get-hostname     'S)
   (lo-url-get-port         'S)
   (lo-url-get-path         'S)
   (lo-strsize              'I)
   (lo-blobsize             'I)
   (lo-pattern-match        'I)
   (lo-timetag-diff         1.0)
   (lo-timetag-now          NIL)    # need util function
   (lo-arg-size             'I)
   (lo-get-path             'S)
   (lo-arg-host-endian      NIL)    # need util function
   (lo-arg-network-endian   NIL)    # need util function 

# prettyprinting
   (lo-bundle-pp            NIL)
   (lo-message-pp           NIL)
   (lo-arg-pp               NIL)
   (lo-server-pp            NIL)
   (lo-method-pp            NIL)
   (lo-method-pp-prefix     NIL)

# server
   (lo-server-new                 'N)
   (lo-server-new-with-proto      'N)
   (lo-server-new-multicast       'N)
   (lo-server-new-multicast-iface 'N)
   (lo-server-new-from-url        'N)
   (lo-server-enable-coersion     'I)
   (lo-server-free                NIL)
   (lo-server-wait                'I)
   (lo-server-recv                'I)
   (lo-server-recv-noblock        'I)
   (lo-server-add-method          'N)
   (lo-server-del-method          NIL)
   (lo-server-add-bundle-handlers 'I)
   (lo-server-get-socket-fd       'I)
   (lo-server-get-port            'I)
   (lo-server-get-protocol        'I)
   (lo-server-get-url             'S)
   (lo-server-enable-queue        'I)
   (lo-server-events-pending      'I)
   (lo-server-next-event-delay    1.0)
   (lo-server-dispatch-data       'I)
]
