http://ju.outofmemory.cn/entry/117751；
作用：使得spring配置文件中不再需要dao接口的bean定义
<mybatis:scan/>与Spring的<context:component-scan/>非常相似，base-package指定要扫描的包，并将包下的所有接口注册为对应的bean。命名规则：和Spring一样，如果该接口没有被注解，则bean的名称为首字母小写的非限定类名，如接口为com.sohu.tv.dao.MyBatisDao，则bean的名字为myBatisDao；如果dao接口使用了Spring的注解，如@Component或@Named等注解，并提供了bean的名称，则mybatis使用该注解的名称作为bean的名称

1：与spring的自动扫描区别在于
    spring开启自动扫描后需要使用类注解告诉spring哪些需要类实例化
    MyBatis开启自动扫描后，不需要注解指定，将包下所有接口实例化并向下转型成实现类（即xml），实例化后的bean名称未指定则依旧为接口名称