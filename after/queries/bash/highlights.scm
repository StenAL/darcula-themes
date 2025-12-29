; extends

; All commands (external and builtin) should be orange
(command_name
  (word) @keyword.command)

; Operators and delimiters should be white
[
  ";"
  "|"
  "||"
  "&&"
  "="
  "+="
  "=="
  "!="
  "=~"
  "<"
  ">"
  ">>"
  "<<"
  "&"
  "|&"
] @punctuation

; Test brackets should be orange
(test_command "[" @punctuation.special)
(test_command "]" @punctuation.special)
(test_command "[[" @punctuation.special)
(test_command "]]" @punctuation.special)

; File descriptors (2>&1) should be blue
(file_descriptor) @number

; Redirect paths should be white (not orange)
; Priority 101 needed to override default @string.special.path capture
((file_redirect
  (word) @variable)
  (#set! priority 101))
