import 'dart:async';
import 'package:flutter/material.dart';
import 'package:morning_diary/components/size_config.dart';
import 'package:morning_diary/screens/list_page/list_page.dart';
import 'package:morning_diary/screens/question_page/question_page.dart';
import 'land.dart';
import 'sun.dart';
import 'tabs.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isFullSun = false;
  bool isDayMood = true;
  final Duration _duration = Duration(seconds: 3);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isFullSun = true;
      });
    });
  }

  void changeMood(int activeTabNum) {
    if (activeTabNum == 0) {
      setState(() {
        isDayMood = true;
      });
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          isFullSun = true;
        });
      });
    } else {
      setState(() {
        isFullSun = false;
      });
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          isDayMood = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Color> lightBgColors = [
      //if (!isFullSun) Color(0xFF8C2480),
      //if (!isFullSun) Color(0xFFCE587D),
      Color(0xFF8C2480),
      Color(0xFFCE587D),
      Color(0xFFFF9485),
      Color(0xFFFFFFFF),
      Color(0xFFb3e5fc),
      if (isFullSun) Color(0xFFb3e5fc),
    ];
    var darkBgColors = [
      Color(0xFF0D1441),
      Color(0xFF283584),
      Color(0xFF376AB2),
    ];
    return AnimatedContainer(
      duration: _duration,
      curve: Curves.easeInOut,
      width: double.infinity,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDayMood ? lightBgColors : darkBgColors,
        ),
      ),
      child: Stack(
        children: [
          Sun(duration: _duration, isFullSun: isFullSun),
          Land(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      VerticalSpacing(of: 50),
                      Tabs(
                        press: (value) {
                          changeMood(value);
                        },
                      ),
                      VerticalSpacing(),
                      Text(
                        '오늘의 다짐',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: 'Nanum',
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      VerticalSpacing(of: 10),
                      Text(
                        '하루의 다짐과 계획을 적으면서 하루를 시작해 보세요',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Nanum',
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListPage(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            fixedSize: Size(150, 50),
                            backgroundColor: Colors.white),
                        child: Text(
                          '리스트',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      VerticalSpacing(
                        of: 10,
                      ),
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
                            backgroundColor: Colors.white),
                        child: Text(
                          '쓰기',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      VerticalSpacing(of: 130),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
