; extends

; Type parameters (T, E, K, V) should be teal
(type_parameter
  (type_identifier) @type.parameter)

; Constructor names should be yellow (override default @type capture)
(constructor_declaration
  name: (identifier) @constructor)
