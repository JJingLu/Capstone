import 'package:flutter/material.dart';

enum FillingSliderDirection { vertical, horizontal }

typedef ChangeCallback = void Function(double newValue, double oldValue);
typedef FinishCallback = void Function(double value);
typedef ChildBuilder = Widget Function(BuildContext context, double value);

class FillingSlider extends StatefulWidget {
  /// Creates a IOS-like slider
  FillingSlider(
      {Key? key,
      this.initialValue = 1.0,
      this.onChange,
      this.knobString,
      this.onFinish,
      this.direction = FillingSliderDirection.vertical,
      this.color = const Color.fromRGBO(46, 45, 36, 0.5),
      this.fillColor = const Color.fromRGBO(215, 216, 218, 0.3),
      this.child,
      this.childBuilder,
      this.width = 80,
      this.height = 200})
      : super(key: key);

  /// Initial value of slider  1.0 <= value >= 0.0
  double initialValue;

  /// Change callback
  final ChangeCallback? onChange;

  /// End of changes callback
  final FinishCallback? onFinish;
  final FillingSliderDirection direction;
  final double height;
  final String? knobString;
  final double width;
  final Color color;
  final Color fillColor;
  final ChildBuilder? childBuilder;
  final Widget? child;

  @override
  _FillingSliderState createState() => _FillingSliderState();
}

class _FillingSliderState extends State<FillingSlider> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext ctx) {
    return widget.direction == FillingSliderDirection.vertical ? getVertical() : getHorizontal();
  }

  void updateData(double position) {
    double currentValue = 0;
    if (widget.direction == FillingSliderDirection.horizontal) {
      currentValue = double.parse(((position / getMainAxisSize())).toStringAsFixed(2));
    } else {
      currentValue = double.parse((1 - (position / getMainAxisSize())).toStringAsFixed(2));
    }
    if (currentValue > 1) {
      currentValue = 1;
    } else if (currentValue < 0) {
      currentValue = 0;
    }
    if (widget.onChange != null) {
      widget.onChange!(currentValue, widget.initialValue);
    }
    setState(() {
      widget.initialValue = currentValue;
    });
  }

  double getMainAxisSize() {
    return widget.direction == FillingSliderDirection.horizontal ? (context.size!.width) : context.size!.height;
  }

  Widget getHorizontal() {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        updateData(details.localPosition.dx);
        print('localdx=${details.localPosition.dx} widgetX=${widget.width}');
      },
      onHorizontalDragEnd: (details) {
        if (widget.onFinish != null) {
          widget.onFinish!(widget.initialValue);
        }
      },
      onTapUp: (details) {
        updateData(details.localPosition.dx);
        if (widget.onFinish != null) {
          widget.onFinish!(widget.initialValue);
        }
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
              widget.fillColor,
              widget.fillColor,
              widget.color,
              widget.color,
            ], stops: [
              0,
              widget.initialValue,
              widget.initialValue + 0.0001,
              1,
            ]),
            borderRadius: BorderRadiusDirectional.circular(10)),
        child: Align(
          alignment: Alignment((-2 * (1 - widget.initialValue) + 1), 0),
          widthFactor: 0.2,
          heightFactor: 1.0,
          child: Container(
              height: 300,
              alignment: Alignment.center,
              width: 35,
              child: (widget.knobString != null)
                  ? Text(
                      widget.knobString!,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  : null,
              transform: Matrix4(
                1.2, 0, 0, 0, // skewY could also be tan(ySkewAngle)
                0, 1.2, 0, 0, // skewX could also be tan(xSkewAngle)
                0, 0, 1, 0, //
                -6, -widget.height * 0.1, 0, 1,
              ),
              decoration: BoxDecoration(
                  color: const Color(0xFF3388FF),
                  border: Border.all(
                    color: Colors.grey.withAlpha(25),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white30.withAlpha(34),
                      spreadRadius: 7,
                      blurRadius: 17,
                      offset: Offset(0, 3), // changes position of shadow
                    )
                  ])),
        ),
      ),
    );
  }

  Widget getVertical() {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        updateData(details.localPosition.dy);
      },
      onVerticalDragEnd: (details) {
        if (widget.onFinish != null) {
          widget.onFinish!(widget.initialValue);
        }
      },
      onTapUp: (details) {
        updateData(details.localPosition.dy);
        if (widget.onFinish != null) {
          widget.onFinish!(widget.initialValue);
        }
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
              widget.fillColor,
              widget.fillColor,
              widget.color,
              widget.color,
            ], stops: [
              0,
              widget.initialValue,
              widget.initialValue + 0.0001,
              1,
            ]),
            borderRadius: BorderRadiusDirectional.circular(15)),
        child: Align(
          alignment: Alignment(0, (-2 * widget.initialValue + 1)),
          widthFactor: 1,
          heightFactor: 0.2,
          child: Container(
              height: 35,
              alignment: Alignment.center,
              width: 300,
              child: (widget.knobString != null)
                  ? Text(
                      widget.knobString!,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  : null,
              transform: Matrix4(
                1.2, 0, 0, 0, // skewY could also be tan(ySkewAngle)
                0, 1.2, 0, 0, // skewX could also be tan(xSkewAngle)
                0, 0, 1, 0, //
                -widget.width * 0.1, -6, 0, 1,
              ),
              decoration: BoxDecoration(
                  color: const Color(0xFF3388FF),
                  border: Border.all(
                    color: Colors.grey.withAlpha(25),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white30.withAlpha(34),
                      spreadRadius: 7,
                      blurRadius: 17,
                      offset: Offset(0, 3), // changes position of shadow
                    )
                  ])),
        ),
      ),
    );
  }
}
