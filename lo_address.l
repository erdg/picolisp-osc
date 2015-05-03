# liblo address functions

(de lo-address-new (HOST PORT)
   (native "liblo.so" "lo_address_new" 'I Host Port) )

(de lo-address-new-from-url (URL)
   (native "liblo.so" "lo_address_new_from_url" 'I URL) )

(de lo-address-free (ADDR)
   (native "liblo.so" "lo_address_free" 'I ADDR) )

(de lo-address-get-hostname (ADDR))

(de lo-address-get-port (ADDR))

(de lo-address-get-protocol (ADDR))

(de lo-address-get-url (ADDR))

(de lo-address-set-ttl (ADDR TTL)) # Time to live

(de lo-address-get-ttl (ADDR))

(de lo-address-set-iface ())

(de lo-address-get-iface ())

(de lo-address-set-tcp-nodelay ())

(de lo-address-set-stream-slip ())
