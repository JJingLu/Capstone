import 'package:flutter/material.dart';
import 'ChatbotWrapper.dart';
import 'Questionnaire.dart';

/*
  (ChatbotWrapper.processText("what is gpt, introduce it")).then((r) {
    print(r);
  });
*/

class ChatbotPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatbotPage> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> _chatMessages = [];

  @override
  void initState() {
    super.initState();
    processUserInput('Hello'); // 发送初始消息
  }

  Future<void> processUserInput(String message) async {
    String response = await ChatbotWrapper.processText(message);

    _chatMessages.add('User: $message');
    _chatMessages.add('Chatbot: $response');

    _textEditingController.clear();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_chatMessages.length >= 20) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => QuestionnairePage(
                  afterChatbot: true,
                )),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
        actions: [
          Text("Progress:" + _chatMessages.length.toString() + "/20"),
          SizedBox(
            width: 20,
          ),
          CircularProgressIndicator(
            value: _chatMessages.length.toDouble() / 20.0,
            backgroundColor: Colors.grey.withAlpha(240),
            valueColor: const AlwaysStoppedAnimation(Colors.blue),
            strokeWidth: 4,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_chatMessages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(hintText: 'Enter a message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String message = _textEditingController.text;
                    processUserInput(message);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatbotTesterPage extends StatelessWidget {
  const ChatbotTesterPage({super.key});

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
      home: ChatbotPage(),
    );
  }
}
