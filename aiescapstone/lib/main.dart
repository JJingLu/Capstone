import 'package:aiescapstone/QuestionCells.dart';
import 'package:aiescapstone/Questionnaire.dart';
import 'package:aiescapstone/SingleValueSliderController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'QuestionCells.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'ChatbotWrapper.dart';
import 'ChatbotPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:http_client_helper/http_client_helper.dart';

void main() async {
/*
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
*/

  runApp(ChatbotTesterPage());
}

class TermsAndConditionSubParagraph extends StatelessWidget {
  const TermsAndConditionSubParagraph({super.key, required this.title, required this.content});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
    ]);
  }
}

class TermsPage extends StatelessWidget {
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
          SizedBox(height: 10),
          Container(
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
              child: Column(children: [
                const Text(
                  "霸王条款",
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                  textAlign: TextAlign.left,
                ),
                const TermsAndConditionSubParagraph(
                    title: "1.条款小标题",
                    content: "这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容..."),
                const TermsAndConditionSubParagraph(
                    title: "2.条款小标题",
                    content: "这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容..."),
                const TermsAndConditionSubParagraph(
                    title: "3.条款小标题",
                    content: "这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容..."),
                const TermsAndConditionSubParagraph(
                    title: "4.条款小标题",
                    content: "这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容..."),
                const TermsAndConditionSubParagraph(
                    title: "4.条款小标题",
                    content: "这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容..."),
                const TermsAndConditionSubParagraph(
                    title: "4.条款小标题",
                    content: "这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容...这里是条款的具体内容..."),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      //在此设置
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(190, 160, 160, 190),
                          Color.fromARGB(190, 190, 160, 160),
                        ]),
                      ),
                      child: ElevatedButton(
                        onPressed: () => {},
                        style: ButtonStyle(
                          //去除阴影
                          elevation: MaterialStateProperty.all(0),
                          //将按钮背景设置为透明
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.close,
                              size: 40,
                              color: Colors.red,
                            ),
                            const Text(
                              'Decline',
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: 290,
                      height: 50,
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
                            MaterialPageRoute(builder: (context) => QuestionnairePage()),
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
                              'I have read and accept',
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            ),
                            const Icon(
                              Icons.check,
                              size: 40,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ])),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Survey',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("AIES final presentation demo");
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Misogyny Survey and Chatbot"),
        ),
        backgroundColor: Colors.black87,
        body: TermsPage());
  }
}
