import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/models/appbar.dart';
import 'package:the_deliverer/models/appcontainer.dart';
import 'package:the_deliverer/widgets/appbutton.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
import 'package:the_deliverer/widgets/appnormaltext.dart';
import 'package:the_deliverer/widgets/appsubheadinhtext.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:Drawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            AppBars(
              ele: 1,
            ),
           // AppHeadingText(text:"Adidas",color: Colors.blue,size: 40,),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child:Container(
               height:250,
       width: MediaQuery.of(context).size.width,

    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    color: Colors.blue,
    image: DecorationImage(
    image:AssetImage("assets/images/culinary.png"),
    fit: BoxFit.fill
              ),
            )
              )

            ),
            Align(
              alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AppSubHeadingText(text: "Description",size: 30,alignment_: TextAlign.left,),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: AppNormalText(text:"We are ready to provide quality and tasty foods to the people.Our special food is Kerala traditonal sadya .Our primary goal is serving quality and healthy foods to all the people.While we serving tasty foods we cares your health",size: 19,alignment_: TextAlign.justify,),
            ),
            Padding(
              padding: const EdgeInsets.only(top:35),
              child: ResponsiveButton(text:"Register",width: 200,size: 30,),
            )
          ],
        ),
      ),


    );
  }
}
