grammar Aviator;

parse:
    statement;

// avitor 语句
statement:
    expression (';'expression)*
;

// aviator 表达式
expression
    : primary #factor
    | expression '[' expression ']' # arrayAccess
    | prefix=('~'|'!'|'-') expression #unary
    | expression op=('*'|'/'|'%') expression#term
    | expression op=('+'|'-') expression #expr
    | expression op=('<<' | '>>>' | '>>') expression#shift
    | expression op=('<'|'>'|'<='|'>=') expression #rel
    | expression op=('=='|'=~'| '!=') expression #equality
    | expression op='&' expression #bitAnd
    | expression op='^' expression #xor
    | expression op='|' expression #bitOr
    | expression op='&&' expression #and
    | expression op='||' expression #join
    | expression op='?' expression ':' expression #ternary
    | IDENTIFIER '=' expression #assign
    ;

primary
    :'(' expression ')'
    | functionExpression
    | lambdaExpression
    ;

// 方法
functionExpression: functionName '(' expressionList?')' ;

functionName: IDENTIFIER ;

// 参数列表
expressionList : expression (',' expression)* ;

//lambda
lambdaExpression :lambdaParameters '->' lambdaBody  ('(' expressionList')')+ ;
lambdaParameters
    : IDENTIFIER
    | '(' IDENTIFIER (',' IDENTIFIER)* ')'
    ;
lambdaBody : expression 'end' ;


// java identifier
IDENTIFIER:;