import 'package:flutter/cupertino.dart';
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
  ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  void initState() {
    super.initState();
    processUserInput('Hello'); // 发送初始消息
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  TextEditingController _textEditingController = TextEditingController();
  List<String> _chatMessages = [];
  bool isWaiting = false;

  Future<void> processUserInput(String message) async {
    String response = await ChatbotWrapper.processText(message);

    _chatMessages.add('Chatbot: $response');

                      
    setState(() {isWaiting = false;     _scrollToBottom();});


  }

  final int totalChat = 10;

  @override
  Widget build(BuildContext context) {
    if (_chatMessages.length >= totalChat) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => QuestionnairePage(
                  afterChatbot: true,
                )),
      );
    }
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Chat App'),
        actions: [
          Text("Progress:" + _chatMessages.length.toString() + "/" + totalChat.toString()),
          SizedBox(
            width: 20,
          ),
          CircularProgressIndicator(
            value: _chatMessages.length.toDouble() / totalChat.toDouble(),
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
              controller: _scrollController,
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                if (_chatMessages[index].contains("Chatbot:")) {
                  return ListTile(
                      title: Row(children: [
                    const Icon(
                      Icons.android,
                      color: Colors.green,
                      size: 50,
                    ),
                    Container(
                        constraints: BoxConstraints(
                          maxWidth: 250.0, // 设置最大宽度为200.0
                        ),
                        //在此设置
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          gradient: const LinearGradient(colors: [
                            Color(0xff30c1fd),
                            Color(0xff846dfc),
                            Color(0xffde53fc),
                          ]),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              _chatMessages[index].substring(8),
                              style: TextStyle(color: Colors.white, fontSize: 18),
                              textAlign: TextAlign.left,
                            ))),
                    Spacer(),
                    SizedBox(
                      width: 50,
                    ),
                  ]));
                }
                return ListTile(
                  title: Row(children: [
                    Spacer(),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                        constraints: BoxConstraints(
                          maxWidth: 250.0, // 设置最大宽度为200.0
                        ),
                        //在此设置
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          gradient: const LinearGradient(colors: [
                            Color(0xffCCCCCC),
                            Color(0x9999DDFF),
                          ]),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              _chatMessages[index].substring(5),
                              style: TextStyle(color: Colors.white, fontSize: 18),
                              textAlign: TextAlign.right,
                            ))),
                    const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 50,
                    ),
                  ]),
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
                    cursorColor: Colors.white,
                    controller: _textEditingController,
                    decoration: InputDecoration(hintText: 'Enter a message',hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                    )),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                (isWaiting)?(CircularProgressIndicator(color: Colors.purple, backgroundColor: Colors.white,)):(IconButton(
                  icon: Icon(
                    Icons.send_rounded,
                    size: 50,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    String message = _textEditingController.text;
                    setState(() {
                      isWaiting = true;
                     _chatMessages.add('User: $message');
    _textEditingController.clear(); 
                    });
                    processUserInput(message);
                  },
                )),
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
