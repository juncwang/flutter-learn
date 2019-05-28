import 'package:flutter/material.dart';

// 创建一个类, 继承于 页面路由构建器
class CustomeRoute extends PageRouteBuilder{

  final Widget widget;

  CustomeRoute(this.widget):super(
      // 过度时间
      transitionDuration: Duration(seconds: 2),
      // 页面构造器
      pageBuilder: (
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
      ){
        return widget;
      },
      transitionsBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
        Widget child,
      )
      {
        // 渐隐渐现路由效果
        // return FadeTransition(
        //   opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        //     parent: animation1,
        //     curve: Curves.fastOutSlowIn
        //   )),
        //   child: child,
        // );

        // 缩放路由效果
        // return ScaleTransition(
        //   scale: Tween( begin: 0.0, end: 1.0).animate(CurvedAnimation(
        //       parent: animation1,
        //       curve: Curves.fastOutSlowIn,
        //     )),
        //   child: child,
        // );

        // 旋转+缩放路由效果
        // return RotationTransition(
        //   turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        //     parent: animation1,
        //     curve: Curves.fastOutSlowIn
        //   )),
        //   child: ScaleTransition(
        //     scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        //       parent: animation1,
        //       curve: Curves.fastOutSlowIn
        //     )),
        //     child: child,
        //   ),
        // );

        // 左右滑动路由效果
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(-1.0, 0.0),
            end: Offset(0.0,0.0),
          ).animate(CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn,
          )),
          child: child,
        );
      }
    );
}