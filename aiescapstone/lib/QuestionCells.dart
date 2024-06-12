import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class GearSelector extends StatefulWidget {
  @override
  _GearSelectorState createState() => _GearSelectorState();
}

class _GearSelectorState extends State<GearSelector> {
  int selectedGear = 1;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final buttonWidth = constraints.maxWidth * 0.1;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                7,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGear = index + 1;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    width: buttonWidth,
                    height: buttonWidth,
                    decoration: BoxDecoration(
                      color:
                          selectedGear == index + 1 ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(buttonWidth * 0.3),
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
            )
          ],
        );
      },
    );
  }
}

class QuestionCell extends StatelessWidget {
  const QuestionCell({super.key, required this.title, required this.content});
  final String title;
  final String content;

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
              Container(
                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(18, 4, 8, 4),
                child: Text(
                  content,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.left,
                ),
              ),
              GearSelector(),
            ]));
  }
}
