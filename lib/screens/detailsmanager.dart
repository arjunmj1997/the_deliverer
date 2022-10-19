



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
  final String? role;


  const DetailsManager({Key? key, this.evid, this.name, this.locationname, this.date, this.address, this.time, this.mobile, this.veg, this.check, this.email, this.radio, this.uid, this.role}) : super(key: key);

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
                      role: widget.role,

                    )));
                  },
                  child: RectangularButton(text: "WORKERS",width:MediaQuery.of(context).size.width * 0.98,size:20,txtcolor: Colors.white,)),
            ),

          ],
        ),

        appBar: AppBar(
          toolbarHeight: 78,
          backgroundColor: Color(0xff094190),
          title:Center(child: AppHeadingText(text: "Details",)),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xffe7e8d1)
            ),



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
                  Padding(
                    padding: const EdgeInsets.only(right:30),
                    child: AppHeadingText(text: "CustomerName: ${widget.name.toString()}"),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: AppHeadingText(text: "Location Name: ${widget.locationname.toString()}"),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left:100),
                    child: Row(
                      children: [
                        AppHeadingText(text: "Mobile",size: 28,),


                        AppHeadingText(text:":${widget.mobile.toString()}",size: 28,)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: AppHeadingText(text: "Date: ${widget.date.toString()}"),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left:20),
                    child: AppHeadingText(text: "Time: ${widget.time.toString()}"),
                  ),


                ],
              ),
            )));


  }


}

