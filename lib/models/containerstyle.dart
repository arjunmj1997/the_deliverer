import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models1.dart';
final BoxDecoration contsyle= BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(topRight: Radius.circular(60),topLeft:Radius.circular(60))

);
final BoxDecoration contsyle1= BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(50)),
  border:Border.all(color: Colors.black54,)

);
final BoxDecoration contsyle2= BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(20)),
  border:Border.all(color: Colors.blue,width: 5)

);
final BoxDecoration contsyle3= BoxDecoration(

       // color: Color(0xff094190),
  color: Color(0xffcf1578),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) )
    );
final BoxDecoration contsyle4= BoxDecoration(

    gradient: LinearGradient(colors: [
        // Color(0xff9542f5),

      Color(0xff0d87d4),
      Color(0xff42b0f5),

    ]),
borderRadius: BorderRadius.circular(20),
 image: DecorationImage(
  image: AssetImage("assets/images/catering.png"),
          fit: BoxFit.fill
     )
    );

