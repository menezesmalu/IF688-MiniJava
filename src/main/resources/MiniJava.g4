grammar MiniJava;
goal:               mainClass classDeclaration* EOF ;
mainClass:          'class' identifier '{' 'public' 'static' 'void' 'main' '(' 'String' '[' ']' identifier ')' '{' statement '}' '}' ;
classDeclaration:   'class' identifier ('extends' identifier)? '{' varDeclaration* methodDeclaration* '}' ;
varDeclaration:     type identifier ';' ;
methodDeclaration:  'public' type identifier '(' (type identifier (',' type identifier)*)? ')' '{' varDeclaration* statement* 'return' expression ';' '}' ;
type:               'int' '[' ']'
    |               'boolean'
    |               'int'
    |               identifier
    ;
statement:          '{' statement* '}'
         |          'if' '(' expression ')' statement 'else' statement
         |          'while' '(' expression ')' statement
         |          'System.out.println' '(' expression ')' ';'
         |          identifier '=' expression ';'
         |          identifier '[' expression ']' '=' expression ';'
         ;
expression:         expression ('&&'|'<'|'+'|'-'|'*') expression
          |         expression '[' expression ']'
          |         expression '.' 'length'
          |         expression '.' identifier '(' (expression (',' expression)*)? ')'
          |         INTEGER_LITERAL
          |         'true'
          |         'false'
          |         identifier
          |         'this'
          |         'new' 'int' '[' expression ']'
          |         'new' identifier '(' ')'
          |         '!' expression
          |         '(' expression ')'
          ;
identifier:         IDENTIFIER ;
INTEGER_LITERAL     : [0]|[1-9][0-9]* ;
IDENTIFIER          : [_A-Za-z][_0-9A-Za-z]* ;
WHITESPACE          : [ \t\r\n\f]+ -> skip ;
SINGLELINE_COMMENT  : '//' ~[\r\n]* -> skip ;
BLOCK_COMMENT       : '/*' .*? '*/' -> skip ;
