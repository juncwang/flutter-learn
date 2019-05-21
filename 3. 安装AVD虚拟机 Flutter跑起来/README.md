### Android studio新建Flutter项目

* 打开Andorid Studio ，会出现下面的界面，我们选择第二项，新建Flutter项目
* 打开第二个窗口后，选择第一个选项Flutter Application(flutter应用)。
* 这步完成后，系统就会自动为我们创建一个Flutter项目（新建项目的过程也是很慢的，它要去谷歌下载gradle，这个东西很容下载失败，如果失败，可以多反复试几次）

### 安装AVD虚拟机

* 点击Android Studio中的上方菜单tool -AVD Manager选项。
* 出现新建菜单，选择Create Virtual Device.....,如果你一个虚拟机也没建过，这个选项在对话框的中间
* 选择虚拟机类型，这个你随意选就好，我选择的是Nexus 5x
* 选择系统，这里尽量选择最新的，我选择了Android 9.0系统，选择好后，又是一个漫长的等待过程
* 安装好后，点击开始按钮，运行虚拟机了

### 让Flutter跑起来

* 虚拟机运行以后，可以点击debug按钮，让Flutter程序跑起来。如果你幸运的话，你的Flutter程序经过编译后，就会跑起来了

### Error runing Gradle 错误解决（1.x版本已经修复）

* 在Debug项目的时候，应该最常见的错误就是类似下面这样的错误了
* 这个问题的产生的原因，还是中国特有的问题，解决方案是改位阿里的链接
* 第一步：修改掉项目下的android目录下的build.gradle文件，把google() 和 jcenter()这两行去掉。改为阿里的链接
```Dart
maven { url 'https://maven.aliyun.com/repository/google' }
maven { url 'https://maven.aliyun.com/repository/jcenter' }
maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
```
* 全部代码：
```Dart
buildscript {
    repositories {
        //  google()
        //  jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public'}
        }
        dependencies {
        classpath 'com.android.tools.build:gradle:3.1.2'
    }
}

allprojects {
    repositories {
        // google()
        // jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
    }
}

rootProject.buildDir = '../build'
subprojects {
    project.buildDir = "${rootProject.buildDir}/${project.name}"
}
subprojects {
    project.evaluationDependsOn(':app')
}

task clean(type: Delete) {
    delete rootProject.buildDir
}
```
* 注意是有两个部分进行了修改，不要只修改一处。
* 第二步：修改Flutter SDK包下的flutter.gradle文件,这个目录要根据你的SDK存放的位置有所变化
```Dart
buildscript {
    repositories {
        //jcenter()
        // maven {
        //     url 'https://dl.google.com/dl/android/maven2'
        // }
        maven{
            url 'https://maven.aliyun.com/repository/jcenter'
        }
        maven{
            url 'http://maven.aliyun.com/nexus/content/groups/public'
        }
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:3.1.2'
    }
}
```
* 然后再重新Debug一下，就基本可以启动起来。
* 还有一种错误是说硬件没有启动GPU，需要下载安装一个程序，这个提示的很清楚，不做过多的介绍了