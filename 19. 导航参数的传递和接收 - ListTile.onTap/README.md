### Awesome Flutter snippets组件的使用

* 因为这节课我们的代码有些多，这时候我们要加快敲代码的速度，可以使用VSCode 中的Awesome Flutter snippets插件
* 它可以帮忙我们快速生成常用的Flutter代码片段
* 比如输入stlss就会给我们生成如下代码

```dart
class name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
```

* 安装完成后，我们可以看这个插件的说明，可以快速生成很多代码片段，能大大加快我们的代码编写速度

### 声明数据结构类

* Dart中可以使用类来抽象一个数据，比如我们模仿一个商品信息，有商品标题和商品描述
* 我们定义了一个Product类，里边有两个字符型变量，title和description

```dart
class Product{
  final String title;  //商品标题
  final String description;  //商品描述
  Product(this.title,this.description);
}
```

### 构建一个商品列表

* 作一个商品的列表，这里我们采用动态的构造方法，在主方法里传递一个商品列表（List）到自定义的Widget中

```dart
void main(){
  runApp(MaterialApp(
    title:'数据传递案例',
    home:ProductList(
      products:List.generate(
        20, 
        (i)=>Product('商品 $i','这是一个商品详情，编号为:$i')
      ),
    )
  ));
}
```

* 上面的代码是主路口文件，主要是在home属性中，我们使用了ProductList，这个自定义组件，而且时候会报错，因为我们缺少这个组件。这个组件我们传递了一个products参数，也就是商品的列表数据，这个数据是我们用List.generate生成的。并且这个生成的List原型就是我们刚开始定义的Product这个类（抽象数据）

* ProductList自定义组件

```dart
class ProductList extends StatelessWidget{
  final List<Product> products;
  ProductList({Key key,@required this.products}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('商品列表')),
      body:ListView.builder(
        itemCount:products.length,
        itemBuilder: (context,index){
          return ListTile(
            title:Text(products[index].title),
            onTap:(){
            }
          );
        },
      )
    );
  }
}
```

* 先接受了主方法传递过来的参数，接受后用ListView.builder方法，作了一个根据传递参数数据形成的动态列表

### 导航参数的传递

我们还是使用Navigator组件，然后使用路由MaterialPageRoute传递参数

```dart
Navigator.push(
  context, 
  MaterialPageRoute(
    builder:(context)=>new ProductDetail(product:products[index])
  )
);
```

* 这段代码要写在onTap相应事件当中。这时候ProductDetail会报错，因为我们还没有生命这个组件或者说是类

### 子页面接受参数并显示

* 现在需要声明ProductDetail这个类（组件），先要作的就是接受参数

```dart
class ProductDetail extends StatelessWidget {
  final Product product;
  ProductDetail({Key key ,@required this.product}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Text('${product.title}'),
      ),
      body:Center(child: Text('${product.description}'),)
    );
  }
}
```

* 先接受了参数，并把数据显示在了页面中

### Demo全部代码如下

```dart
import 'package:flutter/material.dart';

//传递的数据结构,也可以理解为对商品数据的抽象
class Product{
  final String title;  //商品标题
  final String description;  //商品描述
  Product(this.title,this.description);
}

void main(){
  runApp(MaterialApp(
    title:'数据传递案例',
    home:ProductList(
      products:List.generate(
        20, 
        (i)=>Product('商品 $i','这是一个商品详情，编号为:$i')
      ),
    )
  ));
}

class ProductList extends StatelessWidget{
  final List<Product> products;
  ProductList({Key key,@required this.products}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('商品列表')),
      body:ListView.builder(
        itemCount:products.length,
        itemBuilder: (context,index){
          return ListTile(
            title:Text(products[index].title),
            onTap:(){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder:(context)=>new ProductDetail(product:products[index])
                )
              );
            }
          );
        },
      )
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;
  ProductDetail({Key key ,@required this.product}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Text('${product.title}'),
      ),
      body:Center(child: Text('${product.description}'),)
    );
  }
}
```