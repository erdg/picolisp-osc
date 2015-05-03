# liblo message functions

(de lo-message-new ()
   (native "liblo.so" "lo_message_new" NIL) )

(de lo-message-add (MSG TYPES . @)
   (native "liblo.so" "lo_message_add" 'I MSG TYPES (rest)) )

(de lo-message-add-varargs ())

(de lo-message-incref (MSG))

(de lo-message-clone (MSG))

(de lo-message-free (MSG))

(de lo-message-add-int32 ())

(de lo-message-add-float ())

(de lo-message-add-string ())

(de lo-message-add-blob ())

(de lo-message-add-int64 ())

(de lo-message-add-timetag ())

(de lo-message-add-double ())

(de lo-message-add-symbol ())

(de lo-message-add-char ())

(de lo-message-add-midi ())

(de lo-message-add-true ())

(de lo-message-add-false ())

(de lo-message-add-nil ())

(de lo-message-add-infinitum ())

(de lo-message-get-source ())

(de lo-message-get-timestamp (MSG))

(de lo-message-get-types (MSG))

(de lo-message-get-argc (MSG))

(de lo-message-get-argv (MSG))

(de lo-message-length (MSG PATH))

(de lo-message-serialise ())

(de lo-message-deserialise ())
