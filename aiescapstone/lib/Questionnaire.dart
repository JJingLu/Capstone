import 'package:aiescapstone/ChatbotPage.dart';
import 'package:flutter/material.dart';
import 'QuestionCells.dart';

class QuestionnairePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Misogyny Questionnaire"),
        ),
        backgroundColor: Colors.black87,
        body: QuestionnaireContents());
  }
}

class QuestionnaireContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: const Text(
                "✏️ My Misogyny Survey and Chatbot",
                style: TextStyle(color: Colors.white, fontSize: 25),
                textAlign: TextAlign.left,
              )),
          const Padding(
              padding: EdgeInsets.all(18),
              child: const Text(
                "We sincerely invite you to participate in our survey. Before proceeding with the survey, please take a moment to read the following information to understand the purpose of the survey and how we protect your privacy.",
                style: TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.left,
              )),
          Column(children: [
            const QuestionCell(
                title: "1.条款小标题",
                content: "这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容..."),
            const QuestionCell(
                title: "2.条款小标题",
                content: "这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容..."),
            const QuestionCell(
                title: "3.条款小标题",
                content: "这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容..."),
            const QuestionCell(
                title: "4.条款小标题",
                content: "这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容..."),
            const QuestionCell(
                title: "4.条款小标题",
                content: "这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容..."),
            const QuestionCell(
                title: "4.条款小标题",
                content: "这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容..."),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 430,
                  //在此设置
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    gradient: const LinearGradient(colors: [
                      Color(0xff30c1fd),
                      Color(0xff846dfc),
                      Color(0xffde53fc),
                    ]),
                  ),
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatbotPage()),
                      )
                    },
                    style: ButtonStyle(
                      //去除阴影
                      elevation: MaterialStateProperty.all(0),
                      //将按钮背景设置为透明
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Submit and go to chatbot',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 40,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}

/*
          SingleValueSliderController(minVal: 0, maxVal: 5, value: 2.5, name: "Value1", onChange: (double value) => {}), */