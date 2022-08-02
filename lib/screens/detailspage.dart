



import 'package:flutter/material.dart';
import 'package:the_deliverer/widgets/appbutton.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
import 'package:the_deliverer/widgets/customcard.dart';

import '../widgets/recatanglebutton.dart';
class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RectangularButton(text: "ADD",width:MediaQuery.of(context).size.width * 0.25,size:20,txtcolor: Colors.white,),
          GestureDetector(
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left:2,right: 1),
                child: RectangularButton(text: "PAYMENT",width:MediaQuery.of(context).size.width * 0.25,size:20,txtcolor: Colors.white,),
              )
          ),
          Padding(
            padding: const EdgeInsets.only(right:1),
            child: RectangularButton(text: "SWAP",width:MediaQuery.of(context).size.width * 0.23,size:20,txtcolor: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.only(right:1),
            child: RectangularButton(text: "DISABLE",width:MediaQuery.of(context).size.width * 0.25,size:20,txtcolor: Colors.white,),
          ),
        ],
      ),

      appBar: AppBar(
        toolbarHeight: 78,
        backgroundColor: Color(0xff094190),
        title:Padding(
          padding: const EdgeInsets.only(right:40),
          child: Center(child: AppHeadingText(text: "Details",)),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 6,
            itemBuilder: (context, int index) {
              return CustomCard();


            }
        ),
      ),
    );
  }
}
