import 'package:flutter/material.dart';
class AppContainer extends StatelessWidget {
  final double? hi;
  final double? rad;
  final Color? col;
  final Widget? child;

  const AppContainer({Key? key, this.hi=80,this.rad,this.col=Colors.white,this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height:hi,
        width: MediaQuery.of(context).size.width,

    decoration: BoxDecoration(
    //borderRadius: BorderRadius.circular(rad),
      gradient: LinearGradient(colors: [
         Color(0xffe7e8d1),
        Color(0xff42f5a7)
      ]),






    ),
      child: child,

    );
  }
}
