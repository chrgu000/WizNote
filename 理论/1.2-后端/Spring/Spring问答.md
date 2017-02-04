1:Q：在spring启动后，不修改配置文件，不重新加载配置文件的情况下，如何获取spring已经实例化的bean？
A:在spring的配置文件中(一般为application.xml)，加入<bean id="SpringContextUtil " class="com.xx.xx.xx.xx.SpringContextUtil " singleton="true" />。该类实现ApplicationContextAware接口,实例化该类的时候会自动设置applicationContext。
public class SpringContextUtil implements ApplicationContextAware {  
  private static ApplicationContext applicationContext;     //Spring应用上下文环境  
   
  /** 
  * 实现ApplicationContextAware接口的回调方法，设置上下文环境    
  * @param applicationContext 
  * @throws BeansException 
  */  
  public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {  
    SpringContextUtil.applicationContext = applicationContext;  
  }  
   
  /** 
  * @return ApplicationContext 
  */  
  public static ApplicationContext getApplicationContext() {  
    return applicationContext;  
  }  
   
  /** 
  * 获取对象    
  * @param name 
  * @return Object 一个以所给名字注册的bean的实例 
  * @throws BeansException 
  */  
  public static Object getBean(String name) throws BeansException {  
    return applicationContext.getBean(name);  
  }  
   
  /** 
  * 获取类型为requiredType的对象 
  * 如果bean不能被类型转换，相应的异常将会被抛出（BeanNotOfRequiredTypeException） 
  * @param name       bean注册名 
  * @param requiredType 返回对象类型 
  * @return Object 返回requiredType类型对象 
  * @throws BeansException 
  */  
  public static Object getBean(String name, Class requiredType) throws BeansException {  
    return applicationContext.getBean(name, requiredType);  
  }  
   
  /** 
  * 如果BeanFactory包含一个与所给名称匹配的bean定义，则返回true  
  * @param name 
  * @return boolean 
  */  
  public static boolean containsBean(String name) {  
    return applicationContext.containsBean(name);  
  }  
   
  /** 
  * 判断以给定名字注册的bean定义是一个singleton还是一个prototype。 
  * 如果与给定名字相应的bean定义没有被找到，将会抛出一个异常（NoSuchBeanDefinitionException）    
  * @param name 
  * @return boolean 
  * @throws NoSuchBeanDefinitionException 
  */  
  public static boolean isSingleton(String name) throws NoSuchBeanDefinitionException {  
    return applicationContext.isSingleton(name);  
  }  
   
  /** 
  * @param name 
  * @return Class 注册对象的类型 
  * @throws NoSuchBeanDefinitionException 
  */  
  public static Class getType(String name) throws NoSuchBeanDefinitionException {  
    return applicationContext.getType(name);  
  }  
   
  /** 
  * 如果给定的bean名字在bean定义中有别名，则返回这些别名    
  * @param name 
  * @return 
  * @throws NoSuchBeanDefinitionException 
  */  
  public static String[] getAliases(String name) throws NoSuchBeanDefinitionException {  
    return applicationContext.getAliases(name);  
  }  
}
//another service invoke
UserService userService = (UserService) SpringContextUtil.getBean("userService");//直接调用
    (1)实现applicationContextAware的作用
    一般我们在配置文件中让Spring自动装配，但并没有留住ApplicationContext的实例，http://www.cnblogs.com/Johness/archive/2012/12/25/2833010.html
