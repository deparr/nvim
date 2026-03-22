;extends

((call
  function : (identifier) @type.builtin)
 (#any-of? @type.builtin
  "str" "float" "int" "list" "tuple" "bytearray" "bool" "complex" "bytes" "memoryview"
  ))
