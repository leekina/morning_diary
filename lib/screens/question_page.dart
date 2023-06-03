import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:morning_diary/constant.dart';
import 'package:morning_diary/models/question.dart';
import 'package:morning_diary/screens/result_page.dart';

class QuestionPage extends StatelessWidget {
  QuestionPage({super.key});

  static final Question _question = Question();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kQuestionBackgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Question : 1 / 3'),
            SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.6,
                initialPage: 0,
                enableInfiniteScroll: false,
              ),
              items: _question.question.asMap().entries.map((questionList) {
                String question = questionList.value;
                int idx = questionList.key;
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: kCardColors2[idx],
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              question,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            TextField(
                              maxLines: 10,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            )
                          ],
                        ));
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  fixedSize: Size(150, 50),
                  backgroundColor: Color(0xFFF9E5DB)),
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
