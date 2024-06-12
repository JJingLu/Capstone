import 'dart:core';
import 'package:flutter/material.dart';
import 'FillingSlider.dart';

typedef ChangeCallback = void Function(double newValue);

class SingleValueSliderController extends StatefulWidget {
  final double minVal;
  final double maxVal;
  final double increment;
  final bool isExponential;
  final String unit;
  double value;
  final String name;
  final ChangeCallback onChange;

  SingleValueSliderController(
      {super.key, required this.minVal, required this.maxVal, required this.value, required this.name, this.increment = 1, this.isExponential = false, required this.onChange, this.unit = ""});

  @override
  State<SingleValueSliderController> createState() => _SingleValueSliderControllerState();
}

class _SingleValueSliderControllerState extends State<SingleValueSliderController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: Colors.black.withAlpha(120),
            border: Border.all(
              color: Colors.grey.withAlpha(25),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(120),
                spreadRadius: 5,
                blurRadius: 27,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 12),
              child: Row(
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ],
              )),
          Row(
            children: [
              Text(
                "min",
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.left,
              ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: FillingSlider(
                          direction: FillingSliderDirection.horizontal,
                          knobString: '< >',
                          height: 50,
                          color: Colors.white.withAlpha(40),
                          fillColor: Colors.white.withAlpha(100),
                          initialValue: (widget.value - widget.minVal) / (widget.maxVal - widget.minVal),
                          onChange: (newValue, oldValue) {
                            setState(() {
                              widget.value = (widget.maxVal - widget.minVal) * newValue + widget.minVal;
                            });
                            widget.onChange(widget.value);
                          },
                          child: const SizedBox(
                            height: 30,
                            width: 30,
                          )))),
              Text(
                "Max",
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ],
          )
        ]));
  }
}
