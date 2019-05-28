package info.victorchu.boolexp;

/**
 * 表示抽象布尔表达式
 */
public abstract  class AbstractBooleanExpression {

    /**
     * 表达式的执行结果
     * @return boolean
     */
    public abstract boolean evaluate();

    public abstract boolean equal(AbstractBooleanExpression abstractBooleanExpression);

    /**
     * 这个方法是为了将not(AbstractBoolean) 逐级简化到 not(atomBoolean),以用于合成最小项。
     * @return
     */
    public abstract AbstractBooleanExpression simplifiedNot();

    public abstract String print();
}
