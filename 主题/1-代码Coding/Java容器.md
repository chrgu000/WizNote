+ 摘自Java容器深入研究-Java编程思想

+ 容器深入研究:
	+ 17.1:完整的容器类图
	+ 特殊的容器:
		+ LinkedList为实现Queue接口做了修改,以及Queue的其他实现PriorityQueue和各种风格的BlockingQueue.
		+ 用于多线程机制的ConcurrentMap接口和其实现ConcurrentHashMap.
		+ 用于多线程机制的CopyOnWriteArrayList和CopyOnWriteArraySet.
		+ 为使用Enum而设计的Set和Map的特殊实现:EnumSet和EnumMap
	+ 容器的填充和Arrays的填充一样有fill方法,还有nCopies方法.但是fill方法只能替换已经存在List中的元素,不能添加新的元素.fill和nCopies方法只对List对象有用.
	+ 享元:你可以在普通的解决方案需要过多的对象,或者产生普通对象太占用空间时使用享元.享元模式使得对象的一部分可以被具体化,因此,与对象中的所有事物都包含在对象内部不同,我们可以在更具高效的外部表中查找对象的一部分或整体(或者通过某些其他节省空间的计算来产生对象的一部分或整体).
	+ 17.3:Collection的功能方法(请注意其中不包括随机访问所选择元素的get方法.因为Collection)