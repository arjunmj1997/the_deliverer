import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/models/appcontainer.dart';
import 'package:the_deliverer/screens/detailspage.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';

import '../widgets/appnormaltext.dart';
import '../widgets/recatanglebutton.dart';
import 'detailsadmin.dart';

class ListPage extends StatefulWidget {
  final String? name;
  final String? adid;
  const ListPage({Key? key, this.name, this.adid}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xffe7e8d1),
          Color(0xff42f5a7)
        ]),

        // color: Color(0xffe7e8d1),
        // borderRadius: BorderRadius.circular(60)
      ),
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("events").snapshots(),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsAdmin(evid: snapshot.data!.docs[index]['event_id'],
                          name: snapshot.data!.docs[index]['customername'],
                          locationname: snapshot.data!.docs[index]['locationname'],
                          date: snapshot.data!.docs[index]['date'],
                          address: snapshot.data!.docs[index]['address'],
                          time: snapshot.data!.docs[index]['time'],
                          email: snapshot.data!.docs[index]['email'],
                          mobile: snapshot.data!.docs[index]['mobile'],
                          check: snapshot.data!.docs[index]['type2'],
                          radio: snapshot.data!.docs[index]['vegornonvegstatus'],
                          uid: snapshot.data!.docs[index]['managerid'],
                          asignid: snapshot.data!.docs[index]['assignid'],
                            adname: widget.name,
                            adid: widget.adid,



                          )));
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
    )
    );
  }
}
