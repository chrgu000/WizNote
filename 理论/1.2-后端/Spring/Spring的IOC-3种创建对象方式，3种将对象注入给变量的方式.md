使用ApplicationContext的方式实例化Spring容器的核心代码如下：
String conf = "applicationContext.xml";
ApplicationContext ac = 
         new ClassPathXmlApplicationContext(conf);            
使用Spring IOC容器获取对象的3种方法：
    1：调用指定类的构造方法
    2：调用指定类的静态factory-method
    3：调用容器已创建bean的factory-method
        String conf = "applicationContext.xml";
        ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
        EmpDAO dao = ac.getBean("jdbcEmpDao",EmpDAO.class);                                          
Spring默认使用单例模式，applicationContext.xml文件中设置的destroy-method属性仅仅对单例模式起作用，在prototype模式下没有意义。
在顶级的<beans/>元素中的default-init-method属性以及default-destroy-method属性，可以为容器所有<bean>指定初始化回调方法以及指定销毁回调方法
默认情况下Bean对象在Spring容器被创建时就会创建，修改applicationContext.xml，通过设置配置文件属性lazy-init="true"，可以改变Spring容器创建对象的时机，当使用Bean对象时，才被创建，即，设置lazy-init="true"属性后，对象不使用不创建
如何将创建的DAO的bean注入到service：如何指定类中属性的值 
    1：基于service无参构造器，service提供DAO的setter方法，并且在xml配置中指定service Bean的<property name="dao" ref="jdbcEmpDao"></property>
     2:有参构造器的注入方式，通过service的有参构造器，初始化DAO属性值，
        public EmpService(EmpDao dao)    { 
            this.dao = dao;
        } 
        同时xml中配置：根据参数索引<constructor-arg index="0" ref="jdbcEmpDao"></constructor-arg>或者根据参数类型<constructor-arg> <bean class="org.tarena.dao.JdbcEmpDAO"></bean> </constructor-arg>
    3：使用自动装配方式注入，在xml配置文件中，可以在<bean/>元素中使用autowire属性指定自动装配规则，一共有五种类型值：no，byName，byType，constructor，autodetect；其中constructor与byType类似，不同之处在于他应用于构造器参数，autodetect通过bean类来决定使用constructor还是byType，如果发现使用默认的构造器，那么使用byType
        <bean id="updateEmpService" class="org.tarena.service.UpdateEmpService" autowire="byType"> </bean>    
如何注入特殊类型，特殊值：
       注入基本值。 
    <property name="moduleName" value="资费管理"></property>
    <property name="pageSize" value="5"></property>会自行转为int类型被接收        
        注入Spring表达式值
    <util:properties id="jdbcProperties" location="classpath:db.properties"/>
    <property name="username" value="#{jdbcProperties.user}"></property>properties文件内的user值
        注入null或空字符串
    <property name="password" ><null/></property>指定为null
        集合注入(数组以list的方式注入)
        <list>
            <value>北京</value>
            <value>上海</value>
        </list>
        <set>
            <value>James Gosling</value>
            <value>Martin fowler</value>
         </set>
        <map>
            <entry key="1001" value="Java语言基础"></entry>
            <entry key="1002" value="Java Web基础"></entry>
        </map>
        <props>
            <prop key="username">root</prop>
            <prop key="password">1234</prop>
        </props>
使用组件扫描方式注入对象：
    首先，xml配置扫描路径<context:component-scan base-package="com.tarena"/> 
    其次，指定扫描类路径后，并不是该路径下所有组件类都扫描到Spring容器的，只有在组件类定义前面有以下注解标记时，才会扫描到Spring容器：通用注解@Component，持久化层注解@Repository，业务层注解@Service，控制层注解@Controller

注解：
    通常受Spring管理的组件，默认的作用域是"singleton"。如果需要其他的作用域可以使用@Scope注解，只要在注解中提供作用域的名称即可@Scope("singleton")
     @PostConstruct和@PreDestroy注解标记分别用于指定初始化和销毁回调方法
        @PostConstruct 
         public void init() {//初始化回调方法}
    @Resource注解标记可以用在字段定义或setter方法定义前面，默认首先按名称匹配注入，然后类型匹配注入，当遇到多个匹配Bean时注入会发生错误，可以使用注解 @Resource 显式指定名称。 @Resource(name="jdbcEmpDAO")
    @Autowired注解标记可以用在方法前面给参数注入也可以用在字段定义或setter方法定义前面，默认按类型匹配注入，@Autowired当遇到多个匹配Bean时注入会发生错误，可以使用注解 @Qualifier 指定名称
        @Autowired
        public DeleteEmpService(@Qualifier("jdbcEmpDAO")EmpDAO dao) { this.dao = dao;}
    @Inject注解标记是Spring3.0开始增添的对JSR-330标准的支持，使用前需要添加JSR-330的jar包，使用方法与@Autowired相似，@Inject当遇到多个匹配Bean时注入会发生错误，可以使用注解 @Named 指定名称
        @Inject
        public void setDao(@Named("jdbcEmpDAO")EmpDAO dao) { this.dao = dao;}
    @Value注解可以注入Spring表达式值
        在xml配置文件中配置<util:properties id="jdbcProperties" location="classpath:db.properties"/>
        在setter方法或属性变量前使用@Value注解，
            @Value("#{jdbcProperties.user}")
            private String username;
        




