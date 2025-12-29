; extends

; None/True/False should be purple + italic (language constants)
(none) @constant.language
(true) @constant.language
(false) @constant.language

; F-string interpolation braces should be purple
(interpolation
  "{" @string.special.symbol
  "}" @string.special.symbol)
