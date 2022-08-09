import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/models/appbar.dart';
import 'package:the_deliverer/models/containerstyle.dart';
import 'package:the_deliverer/screens/confirmedpage.dart';
import 'package:the_deliverer/screens/detailspage.dart';
import 'package:the_deliverer/screens/pendingpage.dart';
import 'package:the_deliverer/widgets/recatanglebutton.dart';

import '../models/appcontainer.dart';
import '../widgets/appheadingtext.dart';
class FunctionList extends StatefulWidget {
  final String? uid;
  const FunctionList({Key? key, this.uid}) : super(key: key);

  @override
  _FunctionListState createState() => _FunctionListState();
}

class _FunctionListState extends State<FunctionList> with SingleTickerProviderStateMixin{
  late TabController _controller1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller1=TabController(length:3, vsync:this,initialIndex:0);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed:(){}, icon:Icon(Icons.search) )
        ],
        title: Center(child: AppHeadingText(text: "Your List",)),
        backgroundColor: Color(0xff094190),
        bottom: TabBar(
          controller: _controller1,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              text: "PENDING",

            ),

            Tab(
              text: "CONFIRMED",
            ),
            Tab(
              text: "My Events",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller1,
        children: [
          Container(
        height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color(0xffe7e8d1),
               // borderRadius: BorderRadius.circular(60)
            ),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("assignments").where('uid',isEqualTo:widget.uid ).where('status',isEqualTo: 1).snapshots(),
              builder: (context,snapshot){

                if(!snapshot.hasData){

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                else if( snapshot.hasData && snapshot.data!.docs.isEmpty){

                  return Center(
                    child: Text("No data found"),
                  );
                }
                else{
                 return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context,int index){
                        return Container(
                          height:120,
                          width: MediaQuery.of(context).size.width,
                          decoration:BoxDecoration(
                            color: Color(0xffe7e8d1),
                          ),
                          child:Column(
                           // mainAxisAlignment: MainAxisAlignment.start,
                           // crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                           ListTile(
                               leading:CircleAvatar(
                                 backgroundColor: Colors.green,
                               ),
                              title: AppHeadingText(text: snapshot.data!.docs[index]['locationname'],),
                               subtitle: AppHeadingText(text: snapshot.data!.docs[index]['date'],size:20,),
                           ),



                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                        Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: GestureDetector(
                        onTap: () {
                        FirebaseFirestore.instance.collection('assignments').doc(snapshot.data!.docs[index]['assignmentid']).update({

                        'status':2
                        });

                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsAdminEdit()));
                        },
                        child: RectangularButton(text: "CONFIRM",
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.50,
                        size: 15,
                        txtcolor: Colors.white,
                        hi: 35,)),
                        ),


                        Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: GestureDetector(
                        onTap: () {
                        FirebaseFirestore.instance.collection('assignments').doc(snapshot.data!.docs[index]['assignmentid']).update({

                        'status':0,
                          'userstatus':2
                        });
                        },
                        child: RectangularButton(text: "DECLINE",
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.48,
                        size: 15,
                        txtcolor: Colors.white,
                        hi: 35,)),
                        )
                        ],
                        ),
                        ],
                        )
                        );






//      return ListTile(
//       title: Text(snapshot.data!.docs[index]['customername']),
// subtitle:Text(snapshot.data!.docs[index]['locationname']),
//       trailing:
//
//
//   GestureDetector(
//     onTap: (){
//       FirebaseFirestore.instance.collection('assignments').doc(snapshot.data!.docs[index]['assignmentid']).update(
//           {
//             'status': 2
//           }
//       );
//     },
//       child: RectangularButton(text: "Confirm",width:120,hi: 50,)),
//   // GestureDetector(
//   //   onTap: (){
//   //     FirebaseFirestore.instance.collection('assignments').doc(snapshot.data!.docs[index]['assignmentid']).update(
//   //         {
//   //           'status': 2
//   //         }
//   //     );
//   //   },
//   //     child: RectangularButton(text: "Confirm",width:60,hi: 50,)),
//
//
//
//
//
//
//
//     );




                      });
                }

              },
            ),
      ),
           StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("assignments").where('status',isEqualTo: 2).where('uid',isEqualTo:widget.uid).snapshots(),
            builder: (context,snapshot){

              if(!snapshot.hasData){

                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              else if( snapshot.hasData && snapshot.data!.docs.isEmpty){

                return Center(
                  child: Text("No data found"),
                );
              }
              else{
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context,int index){
                      return ListTile(
                        leading: Text(snapshot.data!.docs[index]['date']),
                        title: Text(snapshot.data!.docs[index]['customername']),
                        subtitle:Text(snapshot.data!.docs[index]['locationname']),
                        trailing: RectangularButton(text: "Confirm",width: 120,hi: 50,),






                      );




                    });
              }

            },
          ),

          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("events").where('registeredby',isEqualTo:widget.uid).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text("No data found"),
                  );
                } else {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsPage()));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Color(0xff094190),
                                ),
                                title: AppHeadingText(
                                    text: snapshot.data!.docs[index]['locationname']

                                ),
                                subtitle: AppHeadingText(text:snapshot.data!.docs[index]['date'] ,size: 20,),
                                trailing: AppHeadingText(text:snapshot.data!.docs[index]['regname'] ,size: 20,),
                              )

                          ),
                        );

                      });
                }
              }),


        ],

      )
    );

  }






  }

