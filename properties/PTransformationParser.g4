grammar PTransformationParser;

import PTransformationLexer, PExprLexer, PExprParser;

conversions: importt* conversion* rewrite* transform*;

importt: IMPORT name=NAME;

conversion: CONVERT namefromto object;

namefromto:
  (name=NAME)? FROM from=typename TO to=typename
| (name=NAME)? FOR for=typename
;

typename:
  type=NAME                # nameSimple
| pdef=NAME DOT type=NAME  # nameQualified
;

object: CORCHA crule* CORCHC;

crule: name=NAME COLON value=func (IF condition=expr)?;

anyName:
  NAME
| CONVERT
| REWRITE
| TRANSFORM
| FROM
| TO
| FOR
| STRING_SINGLE
;

exprvalue:
  expr     # valueExpr
| object   # valueObject
| list     # valueList
;

list: BRACKA (exprvalue (COMMA? exprvalue)*)? BRACKC;

rewrite: REWRITE namefromto CORCHA rrule* CORCHC;

rrule: from=NAME ARROW to=NAME;

transform: TRANSFORM namefromto CORCHA trule* CORCHC;

trule: name=NAME;
