import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/appcontainer.dart';
import '../widgets/appheadingtext.dart';
class SendHistory extends StatefulWidget {
  final String? uid;
  final String? name;
  final String? role;
  const SendHistory({Key? key, this.uid, this.name, this.role}) : super(key: key);

  @override
  _SendHistoryState createState() => _SendHistoryState();
}

class _SendHistoryState extends State<SendHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.blue,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('receivingpay').where('payeeid',isEqualTo:widget.uid,).snapshots(),
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
                            return

                              Padding(
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
                                          .docs[index]['date']),
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
                                          .docs[index]['date'],),
                                  ),

                                )
                            );


                          }
                      ): ListView.builder(

                          scrollDirection: Axis.vertical,
                          itemCount:snapshot.data!.docs.length,
                          itemBuilder: (context, int index) {
                            return
                              (snapshot.data!.docs[index]['payeeid']==widget.uid)?
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 1),

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
                                            .docs[index]['date'],),
                                    ),

                                  )
                              ):                                      Padding(
                                  padding: const EdgeInsets.only(
                                      top: 1),

                                  child: AppContainer(
                                    child: ListTile(

                                      title: AppHeadingText(
                                          text: " recieved ${snapshot
                                              .data!
                                              .docs[index]['amount']
                                              .toString()} from ${snapshot
                                              .data!
                                              .docs[index]['payee']
                                              .toString()}"),
                                      subtitle: AppHeadingText(
                                        text: snapshot.data!
                                            .docs[index]['date'],),
                                    ),

                                  )
                              );




                          }
                      );


                  }
                }
            ),
        ),
      ),

    );
  }
}
