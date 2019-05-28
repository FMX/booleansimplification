grammar Aviator;

math_operation
    :
    |math_operation (multiply='*'|devide='/'|mod='%') math_operation    #term
    |math_operation (add='+'|substract='-') math_operation              #expr
    ;


/*********** lexer *************/

DIGITS
    : DIGIT+
    ;


// white space, aviator not support \n in expression
WHITESPACES
    : [ \t\r] -> channel(HIDDEN)
    ;


AND: '&';
JOIN: '|';

fragment DIGIT : [0-9];