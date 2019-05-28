import 'package:flutter/material.dart';
import 'custome_router.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('FirstPage',style: TextStyle(fontSize: 36.0,color: Colors.white),),
        // 融合属性 出现 appBar 出现多少阴影
        elevation: 0.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64,
          ),
          onPressed: (){
            Navigator.of(context).push(CustomeRoute(SecondPage()));
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text('SecondPage',style: TextStyle(fontSize: 36.0,color: Colors.white),),
        elevation: 0.0,
        backgroundColor: Colors.pink,
        // 可以使返回按钮消失
        leading: Container(),
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64,
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}