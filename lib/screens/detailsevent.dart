



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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
class DetailsEvent extends StatefulWidget {
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


  const DetailsEvent({Key? key, this.evid, this.name, this.locationname, this.date, this.address, this.time, this.mobile, this.veg, this.check, this.email, this.radio, this.uid}) : super(key: key);

  @override
  _DetailsEventState createState() => _DetailsEventState();
}

class _DetailsEventState extends State<DetailsEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(



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



            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('events').where('event_id',isEqualTo: widget.evid).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text("No data found"),
                  );
                }
                else {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, int index) {
                        return Container(
                          color: Color(0xffe7e8d1),
                          height:MediaQuery
                              .of(context)
                              .size
                              .height,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
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
                                child: AppHeadingText(text: "CustomerName: ${snapshot.data!.docs[index]['customername']}"),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: AppHeadingText(text: "Mobile: ${snapshot.data!.docs[index]['mobile']}"),
                              ),
                              SizedBox(
                                height: 40,
                              ),



                              Padding(
                                padding: const EdgeInsets.only(left: 60),
                                child: AppHeadingText(text: "Date: ${snapshot.data!.docs[index]['date']}"),
                              ),
                              SizedBox(
                                height: 40,
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left:20),
                                child: AppHeadingText(text: "Time: ${snapshot.data!.docs[index]['time']}"),
                              ),


                            ],
                          ),
                        );
                      }

                  );
                }
              }
                )
                )
                );


  }


}

