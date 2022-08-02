import 'package:flutter/material.dart';

class AppSubHeadingText extends StatelessWidget {
  double? size;
  final String text;
  final Color  color;
  final TextAlign? alignment_;

  AppSubHeadingText({Key? key, this.size=16,required this.text, this.color=Colors.black87,this.alignment_}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

      text,
      textAlign: alignment_,
      style: TextStyle(color: color,fontSize: size,),

    );
  }
}