### Flutter开发环境搭建Windows版

* 系统的基本要求
* 操作系统: 必须windows7以上64位操作系统
* 磁盘空间: 大于3个G，虽然官方说的是400M，但是你还需要安装Android Studio 和 虚拟机，所以至少要3个G左右
* 需要Git环境：Flutter需要git环境的支持，所以这个也要有，作为一个前端，这个是必备工具，所以我在文章中就不教大家安装了

##### JAVA环境的安装

* JAVA环境下载地址：`https://www.oracle.com/technetwork/java/javase/downloads/`
* 安装完成到终端（命令行）里输入java，能出现下图中的结果，说明安装成功。

##### 下载安装 FlutterSDK

* 去官网下载Flutter安装包，下载地址: `https://flutter.dev/docs/get-started/install`
* 将安装包zip解压到你想安装Flutter SDK的路径
* 在Flutter安装目录的flutter文件下找到flutter_console.bat，双击运行并启动flutter命令行，接下来，你就可以在Flutter命令行运行flutter命令了
* 配置环境变量，Flutter的执行是要进行联网的，由于国内的原因，所以你需要设置环境变量
* `export PUB_HOSTED_URL=https://pub.flutter-io.cn`
* `export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn`
* 如果你想在任何地方都可以执行Flutter命令，你需要把Flutter SDK的目录配到环境变量中的path条目下

##### Android Studio的安装
* 下载Android Studio：直接到官网进行下载就可以了。下载地址：`https://developer.android.com/`
* 安装Android Studio 软件
* 打开Android Stuido 软件，然后找到Plugin的配置，搜索Flutter插件

##### 安装Android证书

* 安装好Android Studio后执行 `flutter doctor --android-licenses`
* 然后会提示你选Y/N，不要犹豫，一律选择Y，就可以把证书安装好
* 到这里windows的开发环境就安装的差不多了

##### 进行Flutter doctor 的测试
* 在终端中输入 `flutter doctor`，你可以看到很多 `x`，因为还有很多东西需要安装
* 按提示的信息继续安装