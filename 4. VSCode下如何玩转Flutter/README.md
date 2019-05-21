### VSCode安装Flutter插件

* 打开VSCode的Flutter插件界面，然后用在搜索框中输入Flutter,第一个就是Flutter插件了
* 安装完成后，是需要重启VSCode的

### 开启虚拟机

##### windows 系统

* 新建一个xxx.bat文件到桌面
* 内容为如下
* `C:\Users\Administrator\AppData\Local\Android\Sdk\emulator\emulator.exe -netdelay none -netspeed full -avd Nexus_5X_API_28`
* 第一个参数为虚拟机启动器的路径 最后一个参数为虚拟手机的名称
* 进行保存后双击bat文件，就可以迅速打开虚拟机了

* 参数解释：
* -netdelay none :设置模拟器的网络延迟时间，默认为none，就是没有延迟
* -netspeed full: 设置网络加速值，full代表全速

##### mac 系统

* 命令行输入 `open -a Simulator` 开启虚拟机

# flutter run 开启预览
* 在VSCode中直接打开终端，然后在终端中输入下面的命令
* `flutter run`
* 到此处，终于搭建出了适合前端程序员的开发环境