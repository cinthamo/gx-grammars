lexer grammar PDefinitionLexer;

import PCommonLexer;

IMPORT: 'import';
FLAGS: 'flags';
TYPE: 'type';
EXTENDS: 'extends';
WHEN: 'when';
IF: 'if';

BLOCK_DOC: '/**' .*? '*/';
EOL_DOC: '///' (~[\r\n])*;
