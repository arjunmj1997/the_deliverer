



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/screens/paymentworkers.dart';
import 'package:the_deliverer/screens/selectionworkerslist.dart';
import 'package:the_deliverer/widgets/appbutton.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
import 'package:the_deliverer/widgets/customcard.dart';

import '../widgets/recatanglebutton.dart';
class DetailsPage extends StatefulWidget {
  final String? name;
  final String? eid;
  final String? uid;
  final String? locationname;
  final String? date;
  final String? adname;
  final String? adid;
  final String? role;
  var eventstatus;


   DetailsPage({Key? key, this.name, this.eid, this.uid, this.locationname, this.date, this.adname, this.adid, this.eventstatus, this.role}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var asid;
  @override
  void initState() {
    asid=DateTime.now().toString();
    // TODO: implement initState
    super.initState();
  }
  var user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [


          Padding(
            padding: const EdgeInsets.only(right:1),
              child: GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectionWorkers(
                     evid: widget.eid,
                     payename: widget.adname,
                     adid:'admin123',
                     role: widget.role,
                     adname: widget.adname,
                     
                   )));

                },
                  child: RectangularButton(text: "View Suppliers",width:MediaQuery.of(context).size.width*0.99,size:20,txtcolor: Colors.white,)),
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

       child: StreamBuilder<QuerySnapshot>(
           stream: FirebaseFirestore.instance
               .collection('user')
               .snapshots(),
           builder: (context, snapshot) {

    if (!snapshot.hasData){
    return Center(
    child: CupertinoActivityIndicator(),
    );
    }
    else if(snapshot.hasData && snapshot.data!.docs.isEmpty) {
      return Center(
        child: Text("No data found"),
      );
    }
    else {
      return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context,int index){
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height:120,
                width: MediaQuery.of(context).size.width,
                decoration:BoxDecoration(
                  color: Color(0xffe7e8d1),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(snapshot.data!.docs[index]['name']),
                      subtitle:Text(snapshot.data!.docs[index]['mobile']),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: (){
                              FirebaseFirestore.instance
                                  .collection('assignments')
                                  .doc(asid)
                                  .set({
                                'assignmentid':asid,
                                'event_id': widget.eid,
                                'uid':null,
                                'name':null,
                                'userstatus':0,
                                'customername': widget.name,
                                'locationname':widget.locationname,
                                'date':widget.date,
                                'manageruid':null,
                                'managername':null,
                                'status': 1,
                                'eventstatus': widget.eventstatus,

                              }).then((value) => FirebaseFirestore.instance
                                  .collection('user')
                                  .doc(snapshot.data!.docs[index]['uid']).update({
                                'status':3
                              }) ).then((value) =>FirebaseFirestore.instance
                                  .collection('assignments')
                                  .doc(asid)
                                  .update({


                                'uid':snapshot.data!.docs[index]['uid'],
                                'name':snapshot.data!.docs[index]['name'],
                                'userstatus':snapshot.data!.docs[index]['status'],



                              }) ).then((value) =>FirebaseFirestore.instance
                                  .collection('events')
                                  .doc(widget.eid)
                                  .update({


                                'assignid':asid,




                              }) );
                            },
                              child: Padding(
                                padding: const EdgeInsets.only(left:9),
                                child: RectangularButton(text: "ADD", width: MediaQuery
                                    .of(context)
                                    .size
                                    .width*0.93,

                                    txtcolor: Colors.white,
                                    hi: 35,),
                              )
                          ),
                        SizedBox(
                          width: 5,
                        ),

                      ],
                    ),







                  ],
                ),
              ),
            );




          });

      // return ListView.builder(
      //   scrollDirection: Axis.vertical,
      //   itemCount: snapshot.data!.docs.length,
      //     itemBuilder: (context,int index){
      //       return Padding(
      //         padding: const EdgeInsets.only(top:8.0),
      //         child: ListTile(
      //           title: AppHeadingText(text: snapshot.data!.docs[index]['name'],),
      //           subtitle: AppHeadingText(text:snapshot.data!.docs[index]['mobile'] ,),
      //           leading:RectangularButton(text: "Add",) ,
      //         ),
      //       );
      //     }
      // );

             // return DropdownButtonFormField(
             //   value: user,
             //   isDense: true,
             //   validator: (value) => value == null
             //       ? 'field required'
             //       : null,
             //   onChanged: (clsname) =>
             //       setState(() {
             //         user = clsname;
             //
             //       } ),
             //   hint: Text('Choose Course'),
             //   items: snapshot.data?.docs
             //       .map((DocumentSnapshot snapshot) {
             //     return DropdownMenuItem<String>(
             //       value: snapshot.data['time'],
             //       child:
             //       Text(document.data['name']),
             //     );
             //   }).toList(),
             // );
           }

           }
           ),

      ),
    );
  }
}
