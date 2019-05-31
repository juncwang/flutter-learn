import 'package:flutter/material.dart';

class DarggableWidget extends StatefulWidget {

  final Offset offset;
  final Color widgetColor;

  const DarggableWidget({Key key, this.offset, this.widgetColor}):super(key: key);

  @override
  _DarggableWidgetState createState() => _DarggableWidgetState();
}

class _DarggableWidgetState extends State<DarggableWidget> {

  Offset offset = Offset(0.0, 0.0);

  @override
  void initState() { 
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        data: widget.widgetColor,
        feedback: Container(
          width: 120,
          height: 120,
          color: widget.widgetColor.withOpacity(.5),
        ),
        onDraggableCanceled: (Velocity velocity, Offset offset){
          setState(() {
            this.offset = offset;
          });
        },
        child: Container(
          width: 100,
          height: 100,
          color: widget.widgetColor
        ),
      ),
    );
  }
}