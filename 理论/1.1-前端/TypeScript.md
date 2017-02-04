+ 关于TypeScript:
    + TypeScript 是微软推出的开源语言，使用 Apache 授权协议   
    + TypeScript 是 JavaScript 的超集.   
    + TypeScript 增加了可选类型、类和模块, In TypeScript, two types are compatible if their internal structure is compatible.    
    + TypeScript 可编译成可读的、标准的 JavaScript    
    + TypeScript 支持开发大规模 JavaScript 应用   
    + TypeScript 设计用于开发大型应用，并保证编译后的 JavaScript 代码兼容性   
    + TypeScript 扩展了 JavaScript 的语法，因此已有的 JavaScript 代码可直接与 TypeScript 一起运行无需更改    
    + TypeScript 文件扩展名是 ts，而 TypeScript 编译器会编译成 js 文件   
    + TypeScript 语法与 JScript .NET 相同   
    + TypeScript 易学易于理解

+ TypeScript特性:
    + 类 Classes    with properties, By default they are public, but can also be private or protected.
    + 接口 Interfaces  
    + 构造器  constructor
    + 模块 Modules    
    + 类型注解 Type annotations   
    + 编译时类型检查 Compile time type checking   
    + Arrow 函数 (类似 C# 的 Lambda 表达式
    + 泛型

+ 使用TypeScript(https://www.typescriptlang.org/docs/handbook/gulp.html):
    + 要在应用中使用 TypeScript 必须先编译，编译的结果是生成 js 文件，你可通过 TypeScript 编译器 tsc 来完成这个过程。如果你在 Visual Studio 2012 中使用 TypeScript，它会自动将 ts 文件编译成 js 文件。要编译 TypeScript 文件，可使用如下命令：tsc filename.ts
    + the use of public on arguments to the constructor is a shorthand that allows us to automatically create properties with that name.
    + Put your cursor on the reference to the greeter function, and hit F12 to go to its definition. Notice, too, that you can right-click on a symbol and use refactoring to rename it.
    + 使用自动化构建工具gulp能帮助我们将ts的文件转换成js文件.
    + typeScript的类型声明:
        ```
            function speak(food: string,energy: number): void{
　　            console.log("Our "+ food+ " has "+ energy+ " calories.");
　　        }
            calories: number= 300,
        ```
    + TypeScript所有变量类型:http://www.typelang.org/docs/handbook/basic-types.html
    + TypeScript介绍了导入和导出模块的语句，但是并不能解决文件间的真正连接。TypeScript依赖于第三方函数库来加载外部模块：用于浏览器应用程序的 require.js 和用于 Node.js 的 CommonJS。我们需要下载 require.js，包含在一个标签里。最后一步是编译这两个 .ts 文件。需要添加一个额外的参数来告诉 Type，我们是为 require.js 创建模块的（也被称为AMD），而不是 CommonJS。
        ```
            tsc --module amd *.ts
        ```

    + 概念:
        + Non-nullable 类型标志，防止变量值被设定为 null 或者 undefined。通过 npm install 来直接获取声明文件的新改进系统。控制流类型分析来抓取之前被编译器漏掉的错误。模块导入/导出语句方面的一些创新。另一个被期待已久的特性是在 async/await 块中能够控制异步流功能。