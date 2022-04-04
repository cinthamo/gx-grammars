grammar PTransformationParser;

import PTransformationLexer, PExprLexer, PExprParser;

conversions: importt* conversion* rewrite* transform*;

importt: IMPORT name=NAME;

conversion: CONVERT namefromto CORCHA crule* CORCHC;

namefromto:
  name=NAME FROM from=NAME TO to=NAME
| name=NAME FOR for=NAME
;

crule: name=NAME EQUAL expr;

propName:
  NAME
| CONVERT
| REWRITE
| TRANSFORM
| FROM
| TO
| FOR
| STRING_SINGLE
;

rewrite: REWRITE namefromto CORCHA rrule* CORCHC;

rrule: from=NAME ARROW to=NAME;

transform: TRANSFORM namefromto CORCHA trule* CORCHC;

trule: name=NAME;
