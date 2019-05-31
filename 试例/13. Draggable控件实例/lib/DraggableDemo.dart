import 'package:flutter/material.dart';
import 'DraggableWidget.dart';

class DraggableDemo extends StatefulWidget {
  @override
  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {

  Color _draggableColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DarggableWidget(offset: Offset(80,80), widgetColor: Colors.tealAccent,),
          DarggableWidget(offset: Offset(180,80), widgetColor: Colors.redAccent,),
          Center(
            child: DragTarget(
              onAccept: (Color color){
                _draggableColor = color;
              },
              builder: (context, candidateData, rejectedData){
                return Container(
                  width: 200,
                  height: 200,
                  color: _draggableColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}