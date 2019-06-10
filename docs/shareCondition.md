# 条件共享

Rete 算法的目的是为了提高链式规则系统的执行速度。算法使用了两个经验结论:

* 规则的触发通常只会改变一些事实，只有少数规则会受到这些变化的影响。
* 相同的模式经常出现在多个规则的左侧。

Rete算法可以分为两部分：规则编译和运行时执行。算法将规则生成区分网络，在数据通过网络传播时对数据进行过滤。网络顶部的节点会有很多匹配，当我们沿着网络走下去时，会有更少的匹配。在网络的最底部是终端节点。

![Rete nodes](http://pic.victorchu.info/Rete_Nodes.png)

根节点是所有对象进入网络的地方。

---

参考资料：
* [Rete 算法](https://cis.temple.edu/~ingargio/cis587/readings/rete.html)
* [drools rete 实现](http://docs.jboss.org/drools/release/6.4.0.Final/drools-docs/html_single/index.html#ReteOO)