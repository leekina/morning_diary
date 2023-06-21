// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:morning_diary/components/size_config.dart';
import 'package:morning_diary/constant.dart';
import 'package:morning_diary/models/question.dart';
import 'package:morning_diary/models/sample.dart';
import 'package:morning_diary/repository/sql_database_crud.dart';
import 'package:morning_diary/screens/result_page/result_page.dart';

class QuestionPage extends StatelessWidget {
  static final Question _question = Question();

  const QuestionPage({super.key});

  void saveAnswer(List<String> answerList) async {
    DateTime createAt = DateTime.now();
    print('ansList $answerList');
    var answers = Sample(
      promiseAns0: answerList[0],
      promiseAns1: answerList[1],
      promiseAns2: answerList[2],
      createAt: createAt,
    );
    await SqlSampleCrudRepository.create(answers);
  }

  @override
  Widget build(BuildContext context) {
    List<String> answerList = ['', '', ''];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'asdfad',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: kQuestionBackgroundColor,
        elevation: 0,
      ),
      backgroundColor: kQuestionBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            VerticalSpacing(of: 30),
            Text(_question.promiseQuestion[0]),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                onChanged: (value) {
                  answerList[0] = value;
                },
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Text(_question.promiseQuestion[1]),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                onChanged: (value) {
                  answerList[1] = value;
                },
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Text(_question.promiseQuestion[2]),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                onChanged: (value) {
                  answerList[2] = value;
                },
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            VerticalSpacing(of: 50),
            ElevatedButton(
              onPressed: () {
                //데이터베이스에 저장
                saveAnswer(answerList);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  fixedSize: Size(150, 50),
                  backgroundColor: Colors.white),
              child: Text(
                '저장',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
