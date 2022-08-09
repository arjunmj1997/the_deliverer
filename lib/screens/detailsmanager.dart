



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/models/lists.dart';
import 'package:the_deliverer/screens/detailsadminedit.dart';
import 'package:the_deliverer/screens/detailspage.dart';
import 'package:the_deliverer/screens/managerlist.dart';
import 'package:the_deliverer/screens/payment.dart';
import 'package:the_deliverer/widgets/appbutton.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
import 'package:the_deliverer/widgets/customcard.dart';
import 'package:the_deliverer/widgets/recatanglebutton.dart';
class DetailsManager extends StatefulWidget {
  final String? evid;
  final String? name;
  final String? locationname;
  final String? date;
  final String? address;
  final String? time;
  final String? mobile;
  final String? veg;
  final String? check;
  final String? email;
  final String? radio;
  final String? uid;


  const DetailsManager({Key? key, this.evid, this.name, this.locationname, this.date, this.address, this.time, this.mobile, this.veg, this.check, this.email, this.radio, this.uid}) : super(key: key);

  @override
  _DetailsManagerState createState() => _DetailsManagerState();
}

class _DetailsManagerState extends State<DetailsManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [


            Padding(
              padding: const EdgeInsets.only(left:8),
              child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(
                      name: widget.name,
                      eid: widget.evid,
                      locationname: widget.locationname,
                      date: widget.date,

                    )));
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



            child: Padding(
              padding: const EdgeInsets.only(top:1),
              child: Column(
                children: [
                  //CustomCard(
                  // child: AppHeadingText(text:"CustomerName: ${widget.name.toString()}",color: Colors.blue,),
                  //),
                  // CustomCard(
                  // child: AppHeadingText(text:"email: ${widget.email.toString()}",color: Colors.blue,size: 5,),
                  // ),
                  AppHeadingText(text: "CustomerName: ${widget.name.toString()}")

                ],
              ),
            )));


  }


}

