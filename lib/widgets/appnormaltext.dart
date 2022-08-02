import 'package:flutter/material.dart';

class AppNormalText extends StatelessWidget {
  double? size;
  final String text;
  final color;
  final TextAlign? alignment_;
  FontWeight? fw;

  AppNormalText({Key? key, this.size=12,required this.text, this.color=Colors.black,this.alignment_,this.fw}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color,fontSize: size,fontWeight: fw),
      textAlign: alignment_,

    );
  }
}