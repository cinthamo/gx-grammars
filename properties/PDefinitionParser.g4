grammar PDefinitionParser;

import PDefinitionLexer, PExprLexer, PExprParser;

definitions: importt* flags* type*;

importt: IMPORT name=NAME;

flags: FLAGS name=NAME open=CORCHA flagDefinition* CORCHC;

flagDefinition:
  ddoc=doc* name=NAME COLON ttype=NAME (open=CORCHA fRule* CORCHC)? end?;

fRule:
  name=NAME (EQUAL value=STRING_DOUBLE)? end?;

type:
  TYPE nameExtends open=CORCHA property* CORCHC;

nameExtends:
  name=NAME (EXTENDS ttype=NAME)?            # nameNormal
| EXTENDS etype=NAME (WHEN condition=expr)?  # nameExternal
;

property:
  ddoc=doc* name=idPropName COLON ttype=NAME (open=CORCHA aRule* CORCHC)? end?;

propName:
  NAME
| IMPORT
| FLAGS
| TYPE
| EXTENDS
| WHEN
| STRING_SINGLE
;

idPropName:
  propName
| BOOL
| NOT
| NULL
| VALUE
| IF
| AND
| OR
;

doc:
  BLOCK_DOC
| EOL_DOC
;

aRule:
  name=ruleName EQUAL ccase* otherwise=expr end?   # ruleEqual
| name=ruleName (IF condition=expr)? end?          # ruleBool
;

ruleName:
  name=NAME                  # idName
| fName=NAME DOT name=NAME   # idFlag
;

end: SEMICOLON;
ccase: expr IF expr PIPE;
  