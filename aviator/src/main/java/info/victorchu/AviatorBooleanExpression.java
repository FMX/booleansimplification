package info.victorchu;

import info.victorchu.boolexp.AbstractBooleanExpression;
import info.victorchu.boolexp.AtomBooleanExpression;

/**
 * @Author victor
 * @Email victorchu0610@outlook.com
 * @Data 2019/5/28
 * @Version 1.0
 * @Description TODO
 */
public class AviatorBooleanExpression extends AtomBooleanExpression {

    @Override
    public boolean evaluate() {
        return false;
    }

    @Override
    public boolean equal(AbstractBooleanExpression abstractBooleanExpression) {
        return false;
    }

    @Override
    public String print() {
        return null;
    }
}
