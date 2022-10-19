import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/appheadingtext.dart';
class SearchPage extends StatefulWidget {
  final String? date;
  const SearchPage({Key? key, this.date}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xff094190),
        toolbarHeight: 80,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("events").where('date', isEqualTo: widget.date.toString()).where('status',isEqualTo: 1).snapshots(),
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
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xff094190),
                          ),
                          title: AppHeadingText(
                              text: snapshot.data!.docs[index]['locationname']

                          ),
                          subtitle: AppHeadingText(text:snapshot.data!.docs[index]['date'] ,size: 20,),
                          trailing: AppHeadingText(text:snapshot.data!.docs[index]['regname'] ,size: 20,),
                        ),
                      );

                    });
              }
            }),


      ),
    );
  }
}
