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
    :'(' expression ')'
    | functionExpression
    ;

// 方法
functionExpression: functionName '(' expressionList?')' ;

functionName: IDENTIFIER ;

// 参数列表
expressionList : expression (',' expression)* ;

// java identifier
IDENTIFIER:;