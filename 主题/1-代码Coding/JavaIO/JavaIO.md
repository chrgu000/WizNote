+ Java IO:
	+ 对语言设计师来说,创建一个良好的输入/输出系统是特别困难的:不仅有三种不同的种类的IO需要考虑（文件、控制台、网络连接），而且需要通过大量不同的方式与它们通信（顺序、随机访问、二进制、字符、按行、按字等等）。
		+ InputStream的作用是标志那些从不同起源地产生输入的类。这些起源地包括（每个都有一个相关的InputStream子类）：
			+ (1) 字节数组
			+ (2) String对象
			+ (3) 文件
			+ (4) “管道”，它的工作原理与现实生活中的管道类似：将一些东西置入一端，它们在另一端出来。 
			+ (5) 一系列其他流，以便我们将其统一收集到单独一个流内。
			+ (6) 其他起源地，如Internet连接等（将在本书后面的部分讲述）。
		除此以外，FilterInputStream也属于InputStream的一种类型，用它可为“破坏器”类提供一个基础类，以便将属性或者有用的接口同输入流连接到一起。这将在以后讨论。
		+ ByteArray-InputStream:
			+ Allows a buffer in memory to be used as an InputStream.The buffer from which to extract the bytes.
			+ As a source of data. Connect it to a FilterInputStream object to provide a useful interface.
		+ ByteArray-OutputStream
			+ Creates a buffer in memory. All the data that you send to the stream is placed in this buffer.
			+ Optional initial size of the buffer.
			+ To designate the destination of your data. Connect it to a FilterOutputStream object to provide a useful interface.
			
		+ StringBuffer-InputStream:
			+ Converts a String into an InputStream.
			+ A String. The underlying implementation actually uses a StringBuffer.
			+ As a source of data. Connect it to a FilterInputStream object to provide a useful interface.
			
		+ Buffered-InputStream
			+ Use this to prevent a physical read every time you want more data. You’re saying “Use a buffer.”	
			+ with optional buffer size.This doesn’t provide an interface per se, just a requirement that a buffer be used. Attach an interface object.
		+ Buffered-OutputStream
			+ Use this to prevent a physical write every time you send a piece of data. You’re saying “Use a buffer.” You can call flush( ) to flush the buffer.
			+ with optional buffer size.
			+ This doesn’t provide an interface per se, just a requirement that a buffer is used. Attach an interface object.
			
		+ File-InputStream:
			+ For reading information from a file.
			+ A String representing the file name, or a File or FileDescriptor object.
			+ As a source of data. Connect it to a FilterInputStream object to provide a useful interface.
		+ File-OutputStream
			+ For sending information to a file.
			+ A String representing the file name, or a File or FileDescriptor object.
			+ To designate the destination of your data. Connect it to a FilterOutputStream object to provide a useful interface.
			
		+ Piped-InputStream
			+ Produces the data that’s being written to the associated PipedOutput-Stream. Implements the “piping” concept.
			+ To designate the destination of your data for multithreading. Connect it to a FilterOutputStream object to provide a useful interface.
		+ PipedOutputStream
			+ Any information you write to this automatically ends up as input for the associated PipedInput-Stream. Implements the “piping” concept.
			+ As a source of data in multithreading. Connect it to a FilterInputStream object to provide a useful interface.
			
		+ Sequence-InputStream
			+ Coverts two or more InputStream objects into a single InputStream.
			+ Two InputStream objects or an Enumeration for a container of InputStream objects.
			+ As a source of data. Connect it to a FilterInputStream object to provide a useful interface.
			
		+ Filter-InputStream
			+ Abstract class which is an interface for decorators that provide useful functionality to the other InputStream classes.
			+ Data-InputStream
				+ Used in concert with DataOutputStream, so you can read primitives (int, char, long, etc.) from a stream in a portable fashion.
				+ Contains a full interface to allow you to read primitive types.
		+ Filter-OutputStream
			+ Abstract class which is an interface for decorators that provide useful functionality to the other OutputStream classes. See Table 10-4.
			+ Data-OutputStream
				+ Used in concert with DataInputStream so you can write primitives (int, char, long, etc.) to a stream in a portable fashion.
				+ Contains full interface to allow you to write primitive types.
	
		+ LineNumber-InputStream
			+ Keeps track of line numbers in the input stream; you can call getLineNumber( ) and setLineNumber(int).
			+ This just adds line numbering, so you’ll probably attach an interface object
			
		+ Pushback-InputStream
			+ Has a one byte push-back buffer so that you can push back the last character read.
			+ Generally used in the scanner for a compiler and probably included because the Java compiler needed it. You probably won’t use this.
		
		+ PrintStream:
			+ For producing formatted output. While DataOutputStream handles the storage of data,PrintStream handles display.
			+ with optional boolean indicating that the buffer is flushed with every newline.
			+ Should be the “final” wrapping for your OutputStream object. You’ll probably use this a lot.

		
	+ 本身的缺陷：RandomAccessFile
		+  RandomAccessFile用于包含了已知长度记录的文件，以便我们能用seek()从一条记录移至另一条；然后读取或修改那些记录。各记录的长度并不一定相同；只要知道它们有多大以及置于文件何处即可。
		+ 首先，我们有点难以相信RandomAccessFile不属于InputStream或者OutputStream分层结构的一部分。除了恰巧实现了DataInput以及DataOutput（这两者亦由DataInputStream和DataOutputStream实现）接口之外，它们与那些分层结构并无什么关系。它甚至没有用到现有InputStream或OutputStream类的功能——采用的是一个完全不相干的类。该类属于全新的设计，含有自己的全部（大多数为固有）方法。之所以要这样做，是因为RandomAccessFile拥有与其他IO类型完全不同的行为，因为我们可在一个文件里向前或向后移动。不管在哪种情况下，它都是独立运作的，作为Object的一个“直接继承人”使用。
		+ 从根本上说，RandomAccessFile类似DataInputStream和DataOutputStream的联合使用。其中，getFilePointer()用于了解当前在文件的什么地方，seek()用于移至文件内的一个新地点，而length()用于判断文件的最大长度。此外，构建器要求使用另一个自变量（与C的fopen()完全一样），指出自己只是随机读（"r"），还是读写兼施（"rw"）。这里没有提供对“只写文件”的支持。也就是说，假如是从DataInputStream继承的，那么RandomAccessFile也有可能能很好地工作。
		+ 还有更难对付的。很容易想象我们有时要在其他类型的数据流中搜索，比如一个ByteArrayInputStream，但搜索方法只有RandomAccessFile才会提供。而后者只能针对文件才能操作，不能针对数据流操作。此时，BufferedInputStream确实允许我们标记一个位置（使用mark()，它的值容纳于单个内部变量中），并用reset()重设那个位置。但这些做法都存在限制，并不是特别有用。
		
	+ File类:
		+ 它既代表一个特定文件的名字，也代表目录内一系列文件的名字。若代表一个文件集，便可用list()方法查询这个集，返回的是一个字串数组。之所以要返回一个数组，而非某个灵活的集合类，是因为元素的数量是固定的。事实上，“FilePath”（文件路径）似乎是一个更好的名字。
		+ FileNameFilter:
			public interface FilenameFilter {
				boolean accept(文件目录, 字串名);
			}
		+ File类并不仅仅是对现有目录路径、文件或者文件组的一个表示。亦可用一个File对象新建一个目录，甚至创建一个完整的目录路径——假如它尚不存在的话。亦可用它了解文件的属性（长度、上一次修改日期、读／写属性等），检查一个File对象到底代表一个文件还是一个目录，以及删除一个文件等等。
	+ InputStream的readLine一般都是返回null或者String(如果没读到末尾)
	+ 数据的保存和恢复:
		+ 为了输出数据，以便由另一个数据流恢复，则需用一个DataOutputStream写入数据，并用一个DataInputStream恢复（获取）数据。当然，这些数据流可以是任何东西，但这里采用的是一个文件，并进行了缓冲处理，以加快读写速度。
		+ 注意字串是用writeBytes()写入的，而非writeChars()。若使用后者，写入的就是16位Unicode字符。由于DataInputStream中没有补充的“readChars”方法，所以不得不用readChar()每次取出一个字符。所以对ASCII来说，更方便的做法是将字符作为字节写入，在后面跟随一个新行；然后再用readLine()将字符当作普通的ASCII行读回。
		+ writeDouble()将double数字保存到数据流中，并用补充的readDouble()恢复它。但为了保证任何读方法能够正常工作，必须知道数据项在流中的准确位置，因为既有可能将保存的double数据作为一个简单的字节序列读入，也有可能作为char或其他格式读入。所以必须要么为文件中的数据采用固定的格式，要么将额外的信息保存到文件中，以便正确判断数据的存放位置。
	+ 读写RandomAccessFile:
		+ 正如早先指出的那样，RandomAccessFile与IO层次结构的剩余部分几乎是完全隔离的，尽管它也实现了DataInput和DataOutput接口。所以不可将其与InputStream及OutputStream子类的任何部分关联起来。
		+ 尽管也许能将一个ByteArrayInputStream当作一个随机访问元素对待，但只能用RandomAccessFile打开一个文件。必须假定RandomAccessFile已得到了正确的缓冲，因为我们不能自行选择。可以自行选择的是第二个构建器参数：可决定以“只读”（r）方式或“读写”（rw）方式打开一个RandomAccessFile文件。
		+ 使用RandomAccessFile的时候，类似于组合使用DataInputStream和DataOutputStream（因为它实现了等同的接口）。除此以外，还可看到程序中使用了seek()，以便在文件中到处移动，对某个值作出修改。
	+ 从标准输入中读取数据:
		+ 以Unix首先倡导的“标准输入”、“标准输出”以及“标准错误输出”概念为基础，Java提供了相应的System.in，System.out以及System.err。
		+ 用System.out进行标准输出，它已预封装成一个PrintStream对象。
		+ System.err同样是一个PrintStream，
		+ 但System.in是一个原始的InputStream，未进行任何封装处理。
		+ 这意味着尽管能直接使用System.out和System.err，但必须事先封装System.in，否则不能从中读取数据。
		+ 典型情况下，我们希望用readLine()每次读取一行输入信息，所以需要将System.in封装到一个DataInputStream中。这是Java 1.0进行行输入时采取的“老”办法。Java 1.1的解决方案是。
	+ 管道数据流
		+ 只有在掌握了多线程处理的概念后，才可真正体会PipedInputStream（管道输入流）和PipedOutputStream（管道输出流）的价值所在。原因很简单，因为管道化的数据流就是用于线程之间的通信。
	+  StreamTokenizer和StringTokenizer:
		+ StreamTokenizer类用于将任何InputStream分割为一系列“记号”（Token）。这些记号实际是一些断续的文本块，中间用我们选择的任何东西分隔。例如，我们的记号可以是单词，中间用空白（空格）以及标点符号分隔。 
		+ StringTokenizer的作用是每次返回字串内的一个记号。这些记号是一些由制表站、空格以及新行分隔的连续字符。因此，字串“Where is mycat?”的记号分别是“Where”、“is”、“my”和“cat?”。与StreamTokenizer类似，我们可以指示StringTokenizer按照我们的愿望分割输入。但对于StringTokenizer，却需要向构建器传递另一个参数，即我们想使用的分隔字串。
		+ 通常，如果想进行更复杂的操作，应使用StreamTokenizer。可用nextToken()向StringTokenizer对象请求字串内的下一个记号。该方法要么返回一个记号，要么返回一个空字串（表示没有记号剩下）。
		+ 无论如何，只应将StringTokenizer看作StreamTokenizer一种简单而且特殊的简化形式。然而，如果有一个字串需要进行记号处理，而且StringTokenizer的功能实在有限，那么应该做的全部事情就是用StringBufferInputStream将其转换到一个数据流里，再用它创建一个功能更强大的StreamTokenizer。
	+ 在Java 1.1里添加了Reader和Writer层次，最重要的原因便是国际化的需求。老式IO流层次结构只支持8位字节流，不能很好地控制16位Unicode字符。由于Unicode主要面向的是国际化支持（Java内含的char是16位的Unicode），所以添加了Reader和Writer层次，以提供对所有IO操作中的Unicode的支持。除此之外，新库也对速度进行了优化，可比旧库更快地运行。
		+ Java 1.0的几乎所有IO流类都有对应的Java 1.1类，用于提供内建的Unicode管理。所以最明智的做法是“尝试性”地使用Reader和Writer类。若代码不能通过编译，便知道必须换回老式库。
		+ 尽管BufferedOutputStream是FilterOutputStream的一个子类，但是BufferedWriter并不是FilterWriter的子类（对后者来说，尽管它是一个抽象类，但没有自己的子类或者近似子类的东西，也没有一个“占位符”可用，所以不必费心地寻找）。然而，两个类的接口是非常相似的，而且不管在什么情况下，显然应该尽可能地使用新版本，而不应考虑旧版本（也就是说，除非在一些类中必须生成一个Stream，不可生成Reader或者Writer）。
		