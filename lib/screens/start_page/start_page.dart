import 'package:flutter/material.dart';

import 'package:morning_diary/components/size_config.dart';
import 'package:morning_diary/screens/question_page/question_page.dart';

import 'components/body.dart';

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
