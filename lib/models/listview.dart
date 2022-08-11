import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:the_deliverer/models/appcontainer.dart';
import 'package:the_deliverer/widgets/recatanglebutton.dart';

import '../widgets/appheadingtext.dart';
import 'containerstyle.dart';
class ListViews extends StatefulWidget {
  final String? name;
  final String? role;
  final String? uid;
  final String? adid;
  const ListViews({Key? key, this.name, this.role, this.uid, this.adid}) : super(key: key);

  @override
  _ListViewsState createState() => _ListViewsState();
}

class _ListViewsState extends State<ListViews> {
  @override
  Widget build(BuildContext context) {

        return Container(

          width: MediaQuery
              .of(context)
              .size
              .width,
          // decoration: BoxDecoration(
          //
          //     color: Colors.white,
          //
          //
          //    borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          //     border: Border.all(color: Colors.blue, width:1)
          // ),


              child:Padding(
                padding: const EdgeInsets.only(top: 0,),
                child: Container(
                  height: 80,
                  width:MediaQuery.of(context).size.width*0.95,
                  decoration: BoxDecoration(
                    // gradient: LinearGradient(colors: [
                    //   // Color(0xff9542f5),
                    //
                    //   Color(0xff0d87d4),
                    //   Color(0xff42b0f5),
                    //
                    // ]),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue,width:1),


                  ),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('receivingpay').where('status', whereIn: [1]).where('recieveid',isEqualTo: widget.uid).snapshots(),
                      builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return Center(
                            child: CircularProgressIndicator(),
                          );

                        }
                        else if(snapshot.hasData && snapshot.data!.docs.isEmpty){
                          return Center(
                            child: Text("No data found"),
                          );

                        }
                        else{

                          return
                            (widget.name=="Admin")?
                            ListView.builder(

                              scrollDirection: Axis.vertical,
                              itemCount:snapshot.data!.docs.length,
                              itemBuilder: (context, int index) {
                                return Padding(
                                    padding: const EdgeInsets.only(top: 1),

                                    child: AppContainer(
                                      child: ListTile(

                                        title: AppHeadingText(
                                            text: " paid ${snapshot
                                                .data!
                                                .docs[index]['amount']
                                                .toString()} to ${snapshot
                                                .data!
                                                .docs[index]['recname']
                                                .toString()}"),
                                        subtitle: AppHeadingText(
                                          text: snapshot.data!
                                              .docs.length.toString(),),
                                      ),

                                    )
                                );


                              }
                          ):
                            (widget.role=='manager')?
                            ListView.builder(

                                scrollDirection: Axis.vertical,
                                itemCount:snapshot.data!.docs.length,
                                itemBuilder: (context, int index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(top: 1),

                                      child: AppContainer(
                                        child: ListTile(

                                          title: AppHeadingText(
                                              text: " received ${snapshot
                                                  .data!
                                                  .docs[index]['amount']
                                                  .toString()} from ${snapshot
                                                  .data!
                                                  .docs[index]['payee']
                                                  .toString()}"),
                                          subtitle: AppHeadingText(
                                            text: snapshot.data!
                                                .docs.length.toString(),),
                                        ),

                                      )
                                  );


                                }
                            ): ListView.builder(

                                scrollDirection: Axis.vertical,
                                itemCount:snapshot.data!.docs.length,
                                itemBuilder: (context, int index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(top: 1),

                                      child: AppContainer(
                                        child: ListTile(

                                          title: AppHeadingText(
                                              text: " received ${snapshot
                                                  .data!
                                                  .docs[index]['amount']
                                                  .toString()} from ${snapshot
                                                  .data!
                                                  .docs[index]['payee']
                                                  .toString()}"),
                                          subtitle: AppHeadingText(
                                            text: snapshot.data!
                                                .docs.length.toString(),),
                                        ),

                                      )
                                  );


                                }
                            );


                      }
                      }
                  ),

                ),
              )
        );



  }
}
