grammar PConversionParser;

import PConversionLexer, PExprLexer, PExprParser;

conversions: importt* conversion*;

importt: IMPORT name=NAME;

conversion: CONVERT from=NAME ARROW to=NAME CORCHA crule* CORCHC;

crule: name=NAME EQUAL expr;

propName:
  NAME
| CONVERT
| STRING_SINGLE
;
