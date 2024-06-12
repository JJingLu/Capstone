import 'package:aiescapstone/ChatbotPage.dart';
import 'package:flutter/material.dart';
import 'QuestionCells.dart';

List<Question> questions = [
  Question(
      title: "Question1",
      content: "Women exaggerate problems they have at work"),
  Question(title: "Question2", content: "Women are too easily offended"),
  Question(
      title: "Question3",
      content: "Women seek to gain power by getting control over men"),
  Question(
      title: "Question4",
      content:
          "When women lose to men in a fair competition, they typically complain about being discriminated against"),
  Question(
      title: "Question5",
      content: "It is generally safer not to trust women too much"),
  Question(
      title: "Question6",
      content: "When it comes down to it a lot of women are deceitful"),
  Question(
      title: "Question7",
      content: "I think that most women would lie just to get ahead"),
  Question(
      title: "Question8",
      content: "I am sure I get a raw deal from other women in my life"),
  Question(
      title: "Question9",
      content: "Sometimes other women bother me by just being around"),
  Question(
      title: "Question10", content: "I believe that most women tell the truth"),
  Question(
      title: "Question11",
      content:
          "When I am in a group consisting of equal numbers of men and women and a woman dominates the conversation I feel uncomfortable"),
  Question(
      title: "Question12",
      content:
          "I am uncomfortable when I hear a woman speaking with authority on male dominated topics such as football or horseracing"),
  Question(
      title: "Question13",
      content: "I prefer to listen to male radio announcers than female"),
  Question(
      title: "Question14",
      content:
          "The intellectual leadership of a community should be largely in the hands of men"),
  Question(title: "Question15", content: "I prefer to work for a male boss"),
  Question(
      title: "Question16",
      content:
          "If I were to beat another woman for a job I would feel more satisfied than if I beat a man"),
  Question(
      title: "Question17", content: "Generally, I prefer to work with men"),
];

class Question {
  final String title;
  final String content;
  int selectValue = 0;

  Question({required this.title, required this.content});
}

class QuestionnairePage extends StatefulWidget {
  const QuestionnairePage({super.key});

  @override
  State<QuestionnairePage> createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  double _calculateProgress(List<Question> questions) {
    int answeredQuestions =
        questions.where((question) => question.selectValue != 0).length;
    double progress = answeredQuestions / questions.length;
    return progress;
  }

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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(10.0), // 设置进度指示器的高度
            child: LinearProgressIndicator(
              value: _calculateProgress(questions),
              minHeight: 10,
            ),
          ),
        ),
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
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
                Column(
                  children: questions.map((question) {
                    return QuestionCell(
                      title: question.title,
                      content: question.content,
                      onChanged: (value) {
                        setState(() {
                          question.selectValue = value;
                        });
                      },
                    );
                  }).toList(),
                ),
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
                          if (questions
                              .every((question) => question.selectValue != 0))
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatbotPage()),
                              )
                            }
                          else
                            {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Reminder'),
                                    content:  Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('The following questions are not answered'),
                const SizedBox(height: 8),
                for (var question in questions)
                  (question.selectValue == 0)?Text(question.title):const SizedBox(height: 0,),
              ],
            ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              )
                            }
                        },
                        style: ButtonStyle(
                          //去除阴影
                          elevation: MaterialStateProperty.all(0),
                          //将按钮背景设置为透明
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Submit and go to chatbot',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
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
        ));
  }
}
  
 

/*
          SingleValueSliderController(minVal: 0, maxVal: 5, value: 2.5, name: "Value1", onChange: (double value) => {}), */