# liblo server functions

(de lo-server-new (PORT ERR) # Error handler
   (native "liblo.so" "lo_server_new" 'N PORT ERR) )

(de lo-server-free (S)
   (native "liblo.so" "lo_server_free" NIL S) )

## FIXME ###
(de lo-server-new-from-url (URL ERR)
   (native "liblo.so" "lo_server_new_from_url" 'N URL ERR) )

(de lo-server-recv (SERVER)
   (native "liblo.so" "lo_server_recv" 'I SERVER) )

(de lo-server-recv-noblock (SERVER TIMEOUT)
   (native "liblo.so" "lo_server_recv_noblock" 'I SERVER TIMEOUT) )

(de lo-server-add-method (SERVER PATH TYPES HANDLER DATA) 
   (native "liblo.so" "lo_server_add_method" 'I SERVER PATH TYPES HANDLER DATA) )

(de lo-server-get-url (SERVER)
   (native "liblo.so" "lo_server_get_url" 'S SERVER) )

(de lo-server-get-port (SERVER)
   (native "liblo.so" "lo_server_get_port" 'I SERVER) )

(de lo-server-get-protocol (SERVER)
   (native "liblo.so" "lo_server_get_protocol" 'I SERVER) )

(de lo-server-get-socket-fd (SERVER)
   (native "liblo.so" "lo_server_get_socket_fd" 'I SERVER) )
