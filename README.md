# picolisp-osc
[Liblo](http://liblo.sourceforge.net/) FFI bindings for PicoLisp

## Usage

liblo.l contains the direct ffi-bindings. They are accessible via `ffi` in the `liblo` namespace.

```lisp
pil liblo.l +
(liblo~ffi 'lo-message-new)
```

or

```lisp 
pil +
(symbols 'liblo)
(ffi 'lo-message-new)
``` 

