# picolisp-osc
[Liblo](http://liblo.sourceforge.net/) FFI bindings for PicoLisp

## Assumptions...
Liblo is installed already.
```bash
$ whereis liblo
liblo: /usr/lib/liblo.so
```
If this is not the case, you might
```lisp
(setq *Liblo "/where/my/liblo/is/located")
```
in `liblo.l`.

## Usage

#### liblo.l
`liblo.l` contains the direct ffi-bindings. All functions are accessible via `ffi` in the `liblo` namespace.

```lisp
$ pil liblo.l +
: (liblo~ffi 'lo-message-new)
-> 12066576
```

or

```lisp 
$ pil +
: (symbols 'liblo)
-> pico
liblo: (ffi 'lo-message-new)
-> 12066704
``` 

#### Picolisp DB 
`osc.l` implements an OO wrapper over the functions in `liblo.l`, bringing all that goodness to the PicoLisp DB. This may be a terrible, clunky, or terribly clunky idea.

A session at the PicoLisp repl might look something like this:

```lisp
$ pil osc.l +
: (pool (tmp "osc.db"))
-> T
: (new! '(+OscServer) 6789)   # server at port 6789
-> {2}
: (server-add-method> '{2}    # install a callback to respond to our message
   '(foo-handler ("/foo" "ii") 
      (println "You received an OSC message containing two ints!")))
-> 29242656
: (server-pretty> '{2})   # inspect it! 
socket: 4

Methods

    path:      /foo
    typespec:  ii
    handler:   0x040d780
    user-data: (nil)
-> NIL
: (new! '(+OscAddress) 0 6789)  # localhost, port 6789
-> {3}
: (new! '(+OscMessage))
-> {4}
: (message-add-int32> '{4} 24)
-> 0  # success! 
: (message-add-int32> '{4} 35)
-> 0
: (message-pretty> '{4})  # inspect it! 
,ii 24 35
-> NIL
: (message-send> '{4} '{3} "/foo")  # send message '{4} to path "/foo" at address '{3}
-> 20
: (server-recv> '{2}) 
"You received an OSC message containing two ints!"
-> 20 
: (bye)
```

## Warning
This library is still a baby. It's naive and has a limited world view. The API will certainly change as I figure out exactly what I'm trying to accomplish with PicoLisp and OSC.
