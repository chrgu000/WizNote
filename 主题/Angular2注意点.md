+ Import语句中的"angular2/core"不代表真实路径

+ 修饰器:
     + 修饰器起修改作用是发生在编译时而不是在运行时。
     + 另外只能修饰类跟类的方法，不能修饰function，因为function存在提升的问题，如果直接写实际会被提到最顶部，导致修饰不了。
     + 另外它是跟@对 应的东西是AtScript里面的Annotation– 注解。现在没有AtScript东西了，annotation并不是标准，类似于框架自己说了算的东西，而Decorator是ECMAScript标 准。TypeScript内置实现了Angular 2 里面的annotation的东西，但此时我们还是称之为Decorator。

+ 组件树可以通过属性绑定@Input将数据从根组件传给子组件，通过事件绑定@Output把数据传回给根组件，形成上下数据传播的机制。

+ 在生命周期中增加一些处理,需要implements继承 Hooks，然后在类中编写增加ng前缀的方法名，就可以对相应的生命周期进行操作处理。这里的OnChanges一般搭配SimpleChange来取 前后值，ng2也可以支持自定义变化检测DoCheck,但注意不能与changes同时存在。

+ 首先服务也是可以全局注入的，但是我们不推荐，因为注入粒度不好控制，容易造成冗余。还有一种可能（可选）注入，某些注入服务并不需要用到，你可以加上@Optional()让它变成可选的。还有子注入器应用在实现非单例的情况下。

+ 在模块字符串里面,Angular认为这些空格都是真实的空格，而 不是排版的内容，所以导致输出的字符串中有多个空格，根据这些ES6的坑我们在Github上推出了ES6Coding Style，重点讲讲怎么规范写法，以及要注意哪些坑。

+ angular配置文件参考:https://github.com/Team-Directive17-Angular2/Angular2-Course-Project/commit/177052957fc41660023fbe7c5b8fa50b748d0892
