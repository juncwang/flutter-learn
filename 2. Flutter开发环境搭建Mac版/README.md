### Flutter开发环境搭建Mac版

* 系统环境要求
* MacOS （64-bit）
* 磁盘空间：大于700M，如果算上Android Studio等编辑工具，尽量大于3G。
* 命令号工具：bash、mkdir、rm、git、curl、unzip、which、brew 这些命令在都可以使用。
* 安装 brew
* `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

### 下载Flutter SDK包
* 去官网下载Flutter安装包，下载地址: `https://flutter.dev/docs/get-started/install`

### 配置环境变量
* 压缩包下载好以后，找个位置进行解压，建议放在 `/usr/local/flutter` 下
* 使用vim进行配置环境变量，命令如下：
* `vim ~/.bash_profile`
* 在打开的文件里增加一行代码，意思是配置flutter命令在任何地方都可以使用。
* `export PATH=/usr/local/flutter/bin:$PATH`
* 配置完成后，需要用source命令重新加载一下 ，具体命令如下：
* `source ~/.bash_profile`
* 完成这部以后，就算我们flutter的安装工作完成了，但是这还不能进行开发。可以使用命令来检测一下，是否安装完成了。
* `flutter -h`
* 下面出现 flutter 帮助信息证明安装成功

##### Android Studio的安装
* 下载Android Studio：直接到官网进行下载就可以了。下载地址：`https://developer.android.com/`
* 安装Android Studio 软件
* 打开Android Stuido 软件，然后找到Plugin的配置，搜索Flutter插件

##### 安装Android证书

* 安装好Android Studio后执行 `flutter doctor --android-licenses`
* 然后会提示你选Y/N，不要犹豫，一律选择Y，就可以把证书安装好

##### 安装 xcode 

* 在 appstore 内进行安装

### 检查开发环境

* 在终端中输入 `flutter doctor`，你可以看到很多 `x`，因为还有很多东西需要安装
* 按提示的信息继续安装
* 控制台输入 `pod setup` 安装 pod

### Pub源的配置

* 运行：
* `vim ~/.bash_profile`
* 增加两行配置
* `export PUB_HOSTED_URL=https://pub.flutter-io.cn`
* `export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn`
* 重新加载环境变量
* `source ~/.bash_profile`