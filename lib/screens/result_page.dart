import 'package:flutter/material.dart';
import 'package:morning_diary/screens/start_page.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('data'),
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
                  backgroundColor: Color(0xFFF9E5DB)),
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
