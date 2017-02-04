ResourceBundleMessageSource配置:http://meiyx.iteye.com/blog/1028589

InternalResourceViewResolver配置:http://blog.csdn.net/zxs9999/article/details/6904147

RequestMappingHandlerAdapter配置:
	http://www.360doc.com/content/14/1024/23/18637323_419613178.shtml
	RequestMappingHandlerAdapter取代了DefaultAnnotationHandlerAdapter

SessionLocaleResolver配置:
	http://blog.csdn.net/rj042/article/details/23354225

反序列化对象成文本MappingJacksonHttpMessageConverter配置:http://www.ibm.com/developerworks/cn/web/wa-restful/

乱码StringHttpMessageConverter配置:http://www.360doc.com/content/14/1024/23/18637323_419613562.shtml

开启@Controller和@RequestMapping注解配置:通过处理器映射DefaultAnnotationHandlerMapping和处理器适配器AnnotationMethodHandlerAdapter来开启支持@Controller 和 @RequestMapping注解的处理器

resource配置:http://www.educity.cn/wenda/117654.html  主要优化对静态资源的访问


配置文件详解:
	1：配置文件中的class指定为XXXHandlerMapping表示使用哪种方式进行url和controller之间的映射。
	2： classpath*:（不仅包含class路径，还包括jar文件中(class路径)进行查找） 与classpath:区别：http://zhidao.baidu.com/link?url=Caq7x3ERYbxDcUCkPBfSBZjkfAwRHCyM7XvP7kB5EwzTaD0odPlpaKNEHKzkrOmi5wDUTvQQCboUBnzherbTfREQGF8kZN99ZEKZU8FBJB3

