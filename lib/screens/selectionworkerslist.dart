import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/screens/paymentworkers.dart';
import 'package:the_deliverer/screens/personpayment.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
import 'package:the_deliverer/widgets/customcard.dart';

import '../widgets/recatanglebutton.dart';
class SelectionWorkers extends StatefulWidget {
  final String? evid;
  final String? payename;
  final String? adname;
  final String? adid;
  final String? role;
  const SelectionWorkers({Key? key, this.evid, this.payename, this.adname, this.adid, this.role}) : super(key: key);

  @override
  _SelectionWorkersState createState() => _SelectionWorkersState();
}

class _SelectionWorkersState extends State<SelectionWorkers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff094190),
        title: AppHeadingText(text: "View Suppliers",),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                 .collection('assignments').where('event_id',isEqualTo: widget.evid).where('userstatus',isEqualTo: 3)//.where('status',isEqualTo: 2)
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
                return
                  (widget.adname=="Admin")?
                  ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context,int index){
                      return Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: ListTile(
                            title: Padding(
                            padding: const EdgeInsets.only(left:20),
                            child: Text(snapshot.data!.docs[index]['name']),
                          ),
                         trailing:GestureDetector(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonPay(
                               payename: widget.payename,
                               receiveid: snapshot.data!.docs[index]['uid'],
                               receivename: snapshot.data!.docs[index]['name'],
                               payid: widget.adid,
                             )));
                           },
                             child: RectangularButton(text:"Payment",hi:80,width:80)),
                         leading: GestureDetector(
                            onTap: (){
    FirebaseFirestore.instance.collection('user').doc(snapshot.data!.docs[index]['uid']).update(
        {

          'status': 2
        } );
                            },
                          child: RectangularButton(text:"Cancel",hi:80,width:80)),

                         // subtitle:Text(snapshot.data!.docs[index]['mobile']),




                        ),
                      );




                    }):
                  ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context,int index){
                        return Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(left:20),
                              child: Text(snapshot.data!.docs[index]['name']),
                            ),



                            // subtitle:Text(snapshot.data!.docs[index]['mobile']),




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

        // child: ListView.builder(
        //
        //     itemBuilder:(context,int index){
        //       // return CustomCard(
        //       //   child: ListTile(
        //       //     leading: Checkbox(
        //       //       value: ,
        //       //       onChanged: (value) {
        //       //         setState(() {
        //       //           buffet = value;
        //       //         });
        //       //         if (buffet == true) {
        //       //           option1 = "buffet";
        //       //         }
        //       //       }),
        //       //     ,
        //       //   ),
        //       // );
        //
        //     }
        // ),

      ),
    );
  }
}
