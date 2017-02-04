InputStream Reader converter: InputStreamReader
OutputStream Writer converter: OutputStreamWriter
| Java 1.0 class				| Java 1.1 class		|
| --							| --					|
| FileInputStream 				| FileReader			| 
| FileOutputStream 				| FileWriter			|
| StringBufferInputStream 		| StringReader 			|
| (no corresponding class) 		| StringWriter			|
| ByteArrayInputStream 			| CharArrayReader 		|
| ByteArrayOutputStream 		| CharArrayWriter		|	
| PipedInputStream 				| PipedReader 			|
| PipedOutputStream 			| PipedWriter			|
| FilterInputStream 			| FilterReader			|
| FilterOutputStream 			| FilterWriter（没有子类的抽象类）	|
| BufferedInputStream 			| BufferedReader（也有readLine()）	|
| BufferedOutputStream 			| BufferedWriter					|
| DataInputStream 				| 使用DataInputStream（除非要使用readLine()，那时需要使用一个BufferedReader）	|
| PrintStream 					| PrintWriter			|
| LineNumberInputStream 		| LineNumberReader		|
| StreamTokenizer 				| StreamTokenizer（用构建器取代Reader）		|
| PushBackInputStream 			| PushBackReader		|
ps:
1:若想使用readLine()，就不要再用一个DataInputStream来实现（否则会在编译期得到一条出错消息），而应使用一个BufferedReader。但除这种情况以外，DataInputStream仍是Java 1.1 IO库的“首选”成员。		
2:为了将向PrintWriter的过渡变得更加自然，它提供了能采用任何OutputStream对象的构建器。PrintWriter提供的格式化支持没有PrintStream那么多；但接口几乎是相同的。
3:没有对应Java 1.1类的Java 1.0类:DataOutputStream,File,RandomAccessFile,SequenceInputStream
4:最好为readLine()使用一个BufferedReader（但为其他所有格式化输入都使用一个DataInputStream）。