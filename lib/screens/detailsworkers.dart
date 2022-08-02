



import 'package:flutter/material.dart';
import 'package:the_deliverer/widgets/appbutton.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
import 'package:the_deliverer/widgets/customcard.dart';

import '../widgets/recatanglebutton.dart';
class DetailsWorkers extends StatefulWidget {
  const DetailsWorkers({Key? key}) : super(key: key);

  @override
  _DetailsWorkersState createState() => _DetailsWorkersState();
}

class _DetailsWorkersState extends State<DetailsWorkers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RectangularButton(text: "REMOVE",width:MediaQuery.of(context).size.width,size:25,txtcolor: Colors.white,),

        ],
      ),

      appBar: AppBar(
        toolbarHeight: 78,
        backgroundColor: Color(0xff094190),
        title:Padding(
          padding: const EdgeInsets.only(right:30),
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
