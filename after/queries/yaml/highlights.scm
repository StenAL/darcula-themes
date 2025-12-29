; extends

; Comments should be green (not gray)
(comment) @string.documentation

; Keys should be orange (not purple)
(block_mapping_pair
  key: (flow_node
    (plain_scalar
      (string_scalar) @keyword)))

(block_mapping_pair
  key: (flow_node
    [(double_quote_scalar) (single_quote_scalar)] @keyword))

(flow_mapping
  (_
    key: (flow_node
      (plain_scalar
        (string_scalar) @keyword))))

(flow_mapping
  (_
    key: (flow_node
      [(double_quote_scalar) (single_quote_scalar)] @keyword)))

; Unquoted string values should be white (not green)
(block_mapping_pair
  value: (flow_node
    (plain_scalar
      (string_scalar) @variable)))

; Unquoted strings in flow sequences (inline lists)
(flow_sequence
  (flow_node
    (plain_scalar
      (string_scalar) @variable)))

; Unquoted string values in flow mappings (inline maps)
(flow_pair
  value: (flow_node
    (plain_scalar
      (string_scalar) @variable)))

; Anchors and aliases should be yellow
(anchor_name) @function
(alias_name) @function

; Constants (true, false, null) should be purple
(boolean_scalar) @constant
(null_scalar) @constant
