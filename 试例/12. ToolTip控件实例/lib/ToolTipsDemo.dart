import 'package:flutter/material.dart';

class ToolTipsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToolTipsDemo'),
      ),
      body: Center(
        child: Tooltip(
          child: Image.network('https://cn.bing.com/th?id=OIP.FFqA3eMWhP4t4b5bbBm8MwHaFj&pid=Api&rs=1&p=0'),
          message: 'hello world',
        ),
      ),
    );
  }
}