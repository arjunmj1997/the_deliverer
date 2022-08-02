import 'package:flutter/material.dart';

class AppHeadingText extends StatelessWidget {
  double? size;
  final String text;
  final color;
  FontWeight? fw;

  AppHeadingText({Key? key, this.size=30,required this.text, this.color=Colors.black,this.fw}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color,fontSize: size,fontWeight:fw),

    );
  }
}