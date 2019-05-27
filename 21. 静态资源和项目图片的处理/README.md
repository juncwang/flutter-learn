### pubspec.yaml 文件

* 如果想配置项目资源文件，就需要使用pubspec.yaml文件，需要把资源文件在这里声明。
* 比如在项目根目录下新建了一个images文件夹，文件夹下面放了一个图片，图片的名称叫做blogtouxiang.jpg，那我们在pubspec.yaml文件里就要写如下代码进行声明。

```conf
  assets:
    - images/blogtouxiang.jpg
```

### 使用项目图片资源 

* 有了声明后，我们就可以直接在项目中引用这个文件了。这里使用最简单的代码结构，只用了一张图片

```dart
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('images/blogtouxiang.jpg'),
    );
  }
}
```

* 这时候已经在项目中引入成功了

### Flutter客户端打包

##### 配置APP的图标

* 想配置APP的图片，你需要找到下面的目录：
* 项目根目录 `/android/app/src/main/res/`

* 进入之后你会看到很多mipmap-为前缀命名的文件夹，后边的是像素密度，可以看出图标的分辨率。
    * mdpi (中) ~160dpi
    * hdpi （高） ~240dip
    * xhdpi （超高） ~320dip
    * xxhdpi （超超高） ~480dip
    * xxxhdpi （超超超高） ~640dip
    * 将对应像素密度的图片放入对应的文件夹中,图片记得用png格式，记得名字要统一，才能一次性进行配置

##### AndroidManifest.xml 文件

* 这个文件主要用来配置APP的名称、图标和系统权限，所在的目录在:
* 项目根目录 `/android/app/src/main/AndroidManifest.xml`

```conf
android:label="flutter_app"   //配置APP的名称，支持中文
android:icon="@mipmap/ic_launcher" //APP图标的文件名称
```

##### 生成 keystore

* 官方写的非常简单，只要在终端运行如下代码就可以成功,但事实是报错
* `keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key`

* 用下面的命令找到 `keytool` 的位置
* `flutter doctor -v`

* 文件夹中间带有空空，你需要用带引号扩上 (windows)
* `D:\jre\bin\keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key`

* 我们把命令改成了下面的形式
* ` D:\jre\bin\keytool -genkey -v -keystore D:\key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key`
* 这时候就可以创建成功了。你的D盘下面就会有一个Jks的文件

* 有了这个key.jks文件后，可以到项目目录下的android文件夹下，创建一个名为key.properties的文件，并打开粘贴下面的代码

```conf
storePassword=<password from previous step>    //输入上一步创建KEY时输入的 密钥库 密码
keyPassword=<password from previous step>    //输入上一步创建KEY时输入的 密钥 密码
keyAlias=key
storeFile=<E:/key.jks>    //key.jks的存放路径
```

* 最终配置实例

```conf
storePassword=123123
keyPassword=123123
keyAlias=key
storeFile=D:/key.jks
```

##### 配置key注册

* key生成好后，需要在build.gradle文件中进行配置。这个过程其实很简单，就是粘贴复制一些东西，你是不需要知道这些文件的具体用处的。
* 第一项：
* 进入项目目录的 `/android/app/build.gradle` 文件，在android{这一行前面,加入如下代码：

```conf
def keystorePropertiesFile = rootProject.file("key.properties")
def keystoreProperties = new Properties()
keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
```

* 把如下代码进行替换

```conf
buildTypes {
    release {
        signingConfig signingConfigs.debug
    }
}
```

* 替换成的代码：

```conf
signingConfigs {
    release {
        keyAlias keystoreProperties['keyAlias']
        keyPassword keystoreProperties['keyPassword']
        storeFile file(keystoreProperties['storeFile'])
        storePassword keystoreProperties['storePassword']
    }
}
buildTypes {
    release {
        signingConfig signingConfigs.release
    }
}
```

##### 生成apk

* `flutter build apk`