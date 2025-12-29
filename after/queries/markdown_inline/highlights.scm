; extends

; Make backticks orange (override default conceal)
(code_span_delimiter) @markup.raw.delimiter

; Make link parentheses green
(inline_link
  "(" @markup.link.paren
  ")" @markup.link.paren)
