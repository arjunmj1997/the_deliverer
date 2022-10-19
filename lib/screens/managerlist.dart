



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/screens/personpayment.dart';
import 'package:the_deliverer/widgets/appbutton.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
import 'package:the_deliverer/widgets/customcard.dart';

import '../widgets/recatanglebutton.dart';
class ManagerList extends StatefulWidget {
  final String? name;
  final String? eid;
  final String? uid;
  final String? district;
  final String? assignid;
  final String? adname;
  final String? adid;

  const ManagerList({Key? key, this.name, this.eid, this.uid, this.district, this.assignid, this.adname, this.adid}) : super(key: key);

  @override
  _ManagerListState createState() => _ManagerListState();
}

class _ManagerListState extends State<ManagerList> {

  @override

  var user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // RectangularButton(text: "ADD",width:MediaQuery.of(context).size.width * 0.25,size:20,txtcolor: Colors.white,),
          GestureDetector(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonPay(
                  payename: widget.adname,
                  receiveid: widget.uid,
                  receivename: widget.name,
                  payid:widget.adid ,

                )));
              },
              child: Padding(
                padding: const EdgeInsets.only(left:2,right: 1),
                child: RectangularButton(text: "PAYMENT",width:MediaQuery.of(context).size.width * 0.99,size:20,txtcolor: Colors.white,),
              )
          ),
          Padding(
            padding: const EdgeInsets.only(right:1),
            // child: GestureDetector(
            //   onTap: (){
            //     FirebaseFirestore.instance
            //         .collection('assignments')
            //         .doc(asid)
            //         .set({
            //       'assignmentid':asid,
            //       'event_id': widget.eid,
            //       'customername': widget.name,
            //       'status': 1
            //     }).then((value) => FirebaseFirestore.instance
            //         .collection('user')
            //         .doc().update({
            //       'status':3
            //     }) );
            //   },
            //     child: RectangularButton(text: "ADD",width:MediaQuery.of(context).size.width * 0.23,size:20,txtcolor: Colors.white,)),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right:1),
          //   child: RectangularButton(text: "DISABLE",width:MediaQuery.of(context).size.width * 0.25,size:20,txtcolor: Colors.white,),
          // ),
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
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('manager').where('district',isEqualTo: widget.district).snapshots(),
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
                      return ListTile(
                        title: Text(snapshot.data!.docs[index]['name']),
                        subtitle:Text(snapshot.data!.docs[index]['mobile']),
                        trailing: GestureDetector(
                            onTap: (){
                              FirebaseFirestore.instance
                                  .collection('events')
                                  .doc(widget.eid)
                                  .update({

                                'managername':snapshot.data!.docs[index]['name'],
                                'managerid':snapshot.data!.docs[index]['uid'],
                                'managercontactno':snapshot.data!.docs[index]['mobile'],


                                'status': 1
                              }).then((value) => FirebaseFirestore.instance
                                  .collection('assignments')
                                  .doc(widget.assignid)
                                  .update({


                                'manageruid':widget.uid,



                                'status': 1
                              }) ).then((value) =>  Navigator.pop(context))

                              .then((value) => print('saved'));

                            },
                            child: RectangularButton(text: "ADD",width: 120,hi: 50,)),






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
