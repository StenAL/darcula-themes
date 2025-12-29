; extends

; Text on line 2 (should be blank) - parser marks as ERROR
(ERROR) @error

; Branch name in "On branch main" - high priority to override parent comment
((branch) @markup.link
 (#set! priority 200))
