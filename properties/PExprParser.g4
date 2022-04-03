parser grammar PExprParser;

expr:
  value=NUMBER                  # exprNumber
| value=BOOL                    # exprBool
| value=STRING_DOUBLE           # exprString
| NULL                          # exprNull
| VALUE                         # exprValue
| name=propName                 # exprName
| target=expr DOT prop=NAME     # exprProp
| func                          # exprFunction
| target=expr DOT func          # exprMethod
| left=expr op=MULT right=expr  # exprOperator
| left=expr op=ADD right=expr   # exprOperator
| left=expr op=COMP right=expr  # exprOperator
| left=expr op=EQUAL right=expr # exprOperator
| left=expr op=AND right=expr   # exprOperator
| left=expr op=OR right=expr    # exprOperator
| NOT expr                      # exprNot
| PARA expr PARC                # exprParenthesis
;

func: name=NAME PARA (expr (COMMA expr)*)? PARC;