// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'size_config.dart';

class Sun extends StatelessWidget {
  const Sun({
    Key? key,
    required Duration duration,
    required this.isFullSun,
  })  : _duration = duration,
        super(key: key);

  final Duration _duration;
  final bool isFullSun;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: _duration,
      curve: Curves.easeOut,
      bottom: getProportionateScreenHeight(isFullSun ? 200 : -200),
      left: -(MediaQuery.of(context).size.width / 2),
      child: AnimatedContainer(
        duration: _duration,
        curve: Curves.linear,
        margin: EdgeInsets.only(
            left: isFullSun ? (MediaQuery.of(context).size.width / 2) + 28 : 0),
        child: SvgPicture.asset(
          "assets/icons/Sun.svg",
        ),
      ),
    );
  }
}
