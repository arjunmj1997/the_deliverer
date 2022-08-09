import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/screens/paymentworkers.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
import 'package:the_deliverer/widgets/customcard.dart';

import '../widgets/recatanglebutton.dart';
class SelectionWorkers extends StatefulWidget {
  final String? evid;
  final String? payename;
  const SelectionWorkers({Key? key, this.evid, this.payename}) : super(key: key);

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
                 .collection('assignments').where('event_id',isEqualTo: widget.evid).where('userstatus',isEqualTo: 3)
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
                        padding: const EdgeInsets.only(top: 1),
                        child: ListTile(
                          title: Text(snapshot.data!.docs[index]['name']),
                         trailing:GestureDetector(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentWorkers(
                               payename: widget.payename,
                               receiveid: snapshot.data!.docs[index]['uid'],
                             )));
                           },
                             child: RectangularButton(text:"Payment",hi:80,width:100))
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
