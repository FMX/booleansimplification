package info.victorchu;

import com.googlecode.aviator.AviatorEvaluator;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author victor
 * @Email victorchu0610@outlook.com
 * @Data 2019/5/29
 * @Version 1.0
 * @Description TODO
 */
public class App {
    public static void main(String[] args) {
        String yourName = "Michael";
        Map<String, Object> env = new HashMap<String, Object>();
        env.put("yourName", yourName);
        env.put("hello","hello");
        String result = (String) AviatorEvaluator.execute("(lambda (x,y) -> x + y end) (hello,yourName)", env);
        System.out.println(result);  // hello Michael
    }
}
