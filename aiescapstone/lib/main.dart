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

  runApp(MyApp());
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: const Text(
                "✏️ Participant Information Sheet",
                style: TextStyle(color: Colors.white, fontSize: 25),
                textAlign: TextAlign.left,
              )),
          const Padding(
              padding: EdgeInsets.all(18),
              child: const Text(
                "Research Team:",
                style: TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.left,
              )),
          const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 18, 18),
              child: const Text(
                "•	Jing Lu (Jessie)\n•	AI & Humanity Lab, The University of Hong Kong\n•	jinglu0@connect.hku.hk",
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
                const TermsAndConditionSubParagraph(
                    title: "Introduction: ",
                    content:
                        "You are being invited to participate in a research study. Before you decide whether to participate, it is important for you to understand why the research is being conducted and what it will involve. Please take time to read the following information carefully and discuss it with others if you wish."),
                const TermsAndConditionSubParagraph(
                    title: "Purpose of the Study: ",
                    content:
                        "The purpose of this study is to integrate The Internalized Misogyny Scale (IMS) to initially measure participants' levels of misogyny. Following this, we will employ a conversational AI model trained on a corpus of misogynistic content, supplemented with simple dialogue enhancement techniques. This AI chat assistant will provide advice to individuals within gender-divisive conversations."),
                const TermsAndConditionSubParagraph(
                    title: "What Will Happen During the Study: ",
                    content:
                        "If you agree to participate, you will be asked to: \n1.	Complete The Internalized Misogyny Scale (IMS) questionnaire to measure your levels of misogyny.\n2.	Engage in conversations using a conversational AI model that provides advice within gender-divisive contexts.\n3.	Provide feedback on your experience with the AI chat assistant. The study will take approximately [insert duration] to complete and will take place [insert location or online]."),
                const TermsAndConditionSubParagraph(
                    title: "Risks and Benefits: ",
                    content:
                        "There are minimal risks associated with this study, such as discomfort during conversations about sensitive topics. However, the potential benefits include contributing to the development of tools that can effectively address misogyny in online and offline conversations, promoting more respectful and inclusive dialogue."),
                const TermsAndConditionSubParagraph(
                    title: "Confidentiality: ",
                    content:
                        "All information collected in this study will be not be disclosed. Your identity will not be disclosed in any publications or reports resulting from this research. Data will be stored securely and only the research team will have access to it."),
                const TermsAndConditionSubParagraph(
                    title: "Voluntary Participation: ",
                    content:
                        "Participation in this study is voluntary. You are free to withdraw at any time, without giving a reason, and without any negative consequences. If you decide to withdraw, any data collected from you up to that point will be destroyed and not used in the study."),
                const TermsAndConditionSubParagraph(
                    title: "Questions and Concerns: ",
                    content: "If you have any questions or concerns about the study, please feel free to contact [Researcher's Name] at [contact information]."),
                const TermsAndConditionSubParagraph(
                    title: "Consent: ",
                    content: "By participating in this study, you acknowledge that you have read and understood the information provided above and that you voluntarily agree to participate."),
                const TermsAndConditionSubParagraph(
                    title: "Contact for Complaints:  ",
                    content: "If you have any complaints or concerns about this study, you may contact [Institutional Review Board or Ethics Committee] at [contact information]."),
                Container(
                  padding: EdgeInsets.fromLTRB(18, 4, 8, 4),
                  child: const Text(
                    "Thank you for considering participation in this study. Your contribution is highly valued and will help further our understanding of addressing misogyny through innovative AI solutions.",
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.left,
                  ),
                ),
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
                            MaterialPageRoute(
                                builder: (context) => QuestionnairePage(
                                      afterChatbot: false,
                                    )),
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
