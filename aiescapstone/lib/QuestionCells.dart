import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class GearSelector extends StatefulWidget {
  final ValueChanged<int> onChanged;

  GearSelector({required this.onChanged});

  @override
  _GearSelectorState createState() => _GearSelectorState();
}

class _GearSelectorState extends State<GearSelector> {
  int selectedGear = 0;
  double fabs(double i){
    if(i <0){
      return -i;
    }
    return i;
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double buttonWidth = constraints.maxWidth * 0.09;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                7,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGear = index + 1;
                    });
                    if (widget.onChanged != null) {
                      widget.onChanged(selectedGear);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    width: buttonWidth + 5*fabs((index + 1) - 4),
                    height: buttonWidth + 5*fabs((index + 1) - 4),
                    decoration: BoxDecoration(
                      color:
                          selectedGear == index + 1? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular((buttonWidth + 3*fabs((index + 1) - 4)) * 0.3),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: buttonWidth * 0.4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Strongly Disagree",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Please select 1-7",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Strongly Agree",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class QuestionCell extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final String title;
  final String content;
  int selectValue = 0;
  QuestionCell({
    super.key,
    required this.title,
    required this.content,
    required this.onChanged
  });

  @override
  State<QuestionCell> createState() => _QuestionCellState();
}

class _QuestionCellState extends State<QuestionCell> {
  String getAnswerTitle(int gear) {
    switch (gear) {
      case 1:
        return "Strongly Disagree";
      case 2:
        return "Disagree";
      case 3:
        return "Somewhat Disagree";
      case 4:
        return "Neutral";
      case 5:
        return "Somewhat Agree";
      case 6:
        return "Agree";
      case 7:
        return "Strongly Agree";
      default:
        return "Please Select";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: Colors.grey.withAlpha(30),
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    child: Text(
                      widget.title,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(18, 4, 8, 4),
                    child: Text(
                      getAnswerTitle(widget.selectValue),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Text(
                  widget.content,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.left,
                ),
              ),
              GearSelector(
                onChanged: (value) {
                  setState(() {
                    widget.selectValue = value;
                    widget.onChanged(widget.selectValue);
                  });
                },
              ),
            ]));
  }
}
