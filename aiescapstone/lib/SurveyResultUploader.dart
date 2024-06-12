import 'package:cloud_firestore/cloud_firestore.dart';
import 'Questionnaire.dart';
import 'dart:core';

void saveAnswersToFirebase(List<Question> questions) async {
  print('Saving answers to firebase');
  // 获取Firebase Firestore实例
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // 创建一个新的集合 "answers"，用于存储回答的问题
  CollectionReference answersCollection = firestore.collection('surveyResults');

  Map<String, Object> answersMap = {};

  for (var question in questions) {
    String questionKey = '${question.title} - ${question.content}';
    Object answerValue = question.selectValue;
    answersMap[questionKey] = answerValue;
  }
 
    DocumentReference docRef = await answersCollection.add(answersMap);

    // 打印保存的文档ID
    print('Saved answer with ID: ${docRef.id}');
  
}
