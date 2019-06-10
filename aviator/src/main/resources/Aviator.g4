grammar Aviator;

parse:
    expression;

//我们只使用部分语法，将aviator布尔表达式用于规则匹配
expression
    : primary #factor
    | prefix='!' expression #unary
    | expression op=('<'|'>'|'<='|'>=') expression #rel
    | expression op=('=='|'=~'| '!=') expression #equality
    | expression op='&' expression #bitAnd
    | expression op='^' expression #xor
    | expression op='|' expression #bitOr
    | expression op='&&' expression #and
    | expression op='||' expression #join
    ;

primary
    : '(' expression ')'
    | IDENTIFIER
    | literal
    | functionExpression
    ;

// 方法
functionExpression: functionName '(' expressionList?')' ;

functionName: IDENTIFIER ;

// 参数列表
expressionList : expression (',' expression)* ;

literal
    : integerLiteral
    | floatLiteral
    | CHAR_LITERAL
    | STRING_LITERAL
    | BOOL_LITERAL
    | NULL_LITERAL
    ;

integerLiteral
    : DECIMAL_LITERAL
    | HEX_LITERAL
    | OCT_LITERAL
    | BINARY_LITERAL
    ;

floatLiteral
    : FLOAT_LITERAL
    | HEX_FLOAT_LITERAL
    ;

// java identifier
IDENTIFIER: Letter LetterOrDigit*;
// white space
WS:[ \t\r\n\u000C]+ -> channel(HIDDEN);
CHAR_LITERAL:'\'' (~['\\\r\n] | EscapeSequence) '\'';
STRING_LITERAL:'"' (~["\\\r\n] | EscapeSequence)* '"';

// 布尔字面量
BOOL_LITERAL:'true'
            |'false'
            ;
NULL_LITERAL:'null';
DECIMAL_LITERAL:('0' | [1-9] (Digits? | '_'+ Digits)) [lL]?;
HEX_LITERAL:'0' [xX] [0-9a-fA-F] ([0-9a-fA-F_]* [0-9a-fA-F])? [lL]?;
OCT_LITERAL:        '0' '_'* [0-7] ([0-7_]* [0-7])? [lL]?;
BINARY_LITERAL:     '0' [bB] [01] ([01_]* [01])? [lL]?;
FLOAT_LITERAL:      (Digits '.' Digits? | '.' Digits) ExponentPart? [fFdD]?
             |       Digits (ExponentPart [fFdD]? | [fFdD])
             ;
HEX_FLOAT_LITERAL:  '0' [xX] (HexDigits '.'? | HexDigits? '.' HexDigits) [pP] [+-]? Digits [fFdD]?;

// Fragment rules
fragment ExponentPart
    : [eE] [+-]? Digits
    ;
fragment HexDigits
    : HexDigit ((HexDigit | '_')* HexDigit)?
    ;
fragment EscapeSequence
    : '\\' [btnfr"'\\]
    | '\\' ([0-3]? [0-7])? [0-7]
    | '\\' 'u'+ HexDigit HexDigit HexDigit HexDigit
    ;
fragment HexDigit
    : [0-9a-fA-F]
    ;
fragment Digits
    : [0-9] ([0-9_]* [0-9])?
    ;
fragment LetterOrDigit
    : Letter
    | [0-9]
    ;
fragment Letter
    : [a-zA-Z$_] // these are the "java letters" below 0x7F
    | ~[\u0000-\u007F\uD800-\uDBFF] // covers all characters above 0x7F which are not a surrogate
    | [\uD800-\uDBFF] [\uDC00-\uDFFF] // covers UTF-16 surrogate pairs encodings for U+10000 to U+10FFFF
    ;