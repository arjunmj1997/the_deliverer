



import 'package:flutter/material.dart';
import 'package:the_deliverer/screens/detailsadminedit.dart';
import 'package:the_deliverer/screens/detailspage.dart';
import 'package:the_deliverer/screens/payment.dart';
import 'package:the_deliverer/widgets/appbutton.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
import 'package:the_deliverer/widgets/customcard.dart';
import 'package:the_deliverer/widgets/recatanglebutton.dart';
class DetailsAdmin extends StatefulWidget {
  const DetailsAdmin({Key? key}) : super(key: key);

  @override
  _DetailsAdminState createState() => _DetailsAdminState();
}

class _DetailsAdminState extends State<DetailsAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsAdminEdit()));
            },
              child: RectangularButton(text: "EDIT",width:MediaQuery.of(context).size.width * 0.50,size:20,txtcolor: Colors.white,)
          ),

               Padding(
                 padding: const EdgeInsets.only(left:8),
                 child: GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage()));
                   },
                     child: RectangularButton(text: "WORKERS",width:MediaQuery.of(context).size.width * 0.48,size:20,txtcolor: Colors.white,)),
               ),

        ],
      ),

      appBar: AppBar(
        toolbarHeight: 78,
        backgroundColor: Color(0xff094190),
        title:Center(child: AppHeadingText(text: "Details",)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 6,
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top:1),
                child: CustomCard(),
              );


            }
        ),
      ),
    );
  }
}
