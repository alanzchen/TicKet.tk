SPS自述文件
==
一、关于SPS
--
    SPS是Shortest Path Search的缩写，从属于TicKet工程。SPS在TicKet工程中作为后端处理部分而存在，负责计算最小费用路径并输出数据到数据库。

二、安装及编译
--
    为了便于移植，SPS是使用Lazarus开发的。所有文件，在Windows XP SP2+Lazarus 0.9.28及Arch Linux+Lazarus 1.0.4下编译通过并可以运行。
    如果要编译SPS并产生可执行的文件，请按照以下顺序操作：
    1、在Lazarus下，安装包SQLite3Laz。一般来说，在 包——配置已安装的包——可用的包 里面你应该能找到这个包。在Lazarus 0.9.28下，这个包的版本是0.4。如果那里找不到，则可以点击 包——打开包文件——%Lazarus安装根目录%\components\sqlite3laza.lpk ，然后安装此包。这是一个静态包，而SPS是CUI程序，不需要用到可视控件，因此你并不需要重新编译IDE。
    2、安装SQLite3。SPS的数据库使用基于SQLite3的本地数据库，因此为了编译SPS，你必须先安装SQLite3。在Linux下，你可以使用Linux的包管理器如apt-get或者Pacman来安装。在Windows下，你仅需下载一个SQLite3.dll并放在windows/system32下即可。
    3、用Lazarus打开SPS.lpi并编译。这是SPS工程的信息文件，Lazarus会自动加载SPS工程所需的所有.pas源代码文件。所有的文件已经被配置好，你只需点击 运行——构建 即可链接产生一个可执行的文件。编译出来的文件名应该是SPS.exe或SPS（对应Windows下和Linux下）。

三、文件组成
--
    SPS包括以下几个文件，以及每个文件的作用：
    SPS.pas           SPS工程的主体文件，也可以视作是一个外壳。负责完成输入数据的初始化后调用计算内核进行计算，并输出日志文件。
    SearchKernel.pas  SPS工程的核心文件，为搜索算法的实现。
    SysData.pas       SPS工程所有的数据类型、公共变量及常量定义，以及写日志接口。
    Citys.pas         提供城市的数据及查询。
    DatabaseIO.pas    负责输入数据的处理及转换，以及结果输出到数据库的实现。
    SysDAT.pas	      一个关于系统时间的接口。
    SPS.lpi           SPS工程信息文件。

四、使用SPS
--
    SPS必须通过命令行传递参数启动。对于SPS的启动命令行格式，SPS.pas第29行开始有详细的注释说明。
    对于输入数据的要求和输出数据的格式，请详细阅读DatabaseIO.pas中的注释，里面有完整的说明。
    对于其他内容，建议阅读源文件，里面均有足够的注释帮助理解SPS的工作原理。
    SPS在运行时，输出日志信息以帮助了解运行情况和排查错误。SPS会自动创建或向SysLog.log中添加日志内容，并且输出到控制台窗口中。