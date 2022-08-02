import 'package:flutter/material.dart';


class RectangularButton extends StatelessWidget {

  bool? isResponsive;
  String text;
  double? width;
  Color? txtcolor=Colors.black;
  Color? iconcolor=Colors.black;
  Color? col;
  double? size;
  double? hi;

  RectangularButton({Key? key,required this.text,this.width  ,this.isResponsive,this.txtcolor,this.iconcolor,this.size,this.hi=50,this.col=Colors.blue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hi,
      decoration: BoxDecoration(
          color: col,
         // borderRadius: BorderRadius.circular(20)
      ),


            child:Center(
              child: Text(text,style: TextStyle(color: txtcolor,fontSize: size),

              ),
            ),
            //Icon(Icons.arrow_forward_ios,color: iconcolor,),



    );
  }
}