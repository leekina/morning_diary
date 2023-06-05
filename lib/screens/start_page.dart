import 'package:flutter/material.dart';
import 'package:morning_diary/components/body.dart';
import 'package:morning_diary/components/size_config.dart';
import 'package:morning_diary/screens/question_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}

class Empty extends StatelessWidget {
  const Empty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          Text(
            '오늘의 다짐',
            style: TextStyle(color: Colors.black, fontSize: 30),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            '하루의 다짐과 계획을 적으면서 하루를 시작해 보세요',
            style: TextStyle(color: Colors.black, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          Icon(
            Icons.image,
            size: MediaQuery.of(context).size.width,
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionPage(),
                  ));
            },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: Size(150, 50),
                backgroundColor: Color(0xFFF9E5DB)),
            child: Text(
              '쓰기',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
