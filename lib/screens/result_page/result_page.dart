import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:morning_diary/constant.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kQuestionBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(DateFormat('yy/MM/dd').format(now)),
            Text(
              '15일 째 아침일기를 적고있습니다.\n 오늘의 부산은 비가올 것 같습니다. 우산을 챙겨가시길 바랍니다.',
              style: TextStyle(
                  fontFamily: 'Nanum',
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            Icon(
              Icons.image,
              size: MediaQuery.of(context).size.width,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName("/"));
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  fixedSize: Size(200, 50),
                  backgroundColor: Colors.white),
              child: Text(
                '홈으로 돌아가기',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
