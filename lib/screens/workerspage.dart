import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/screens/detailsworkers.dart';

import '../models/appcontainer.dart';
import '../widgets/appheadingtext.dart';
class WorkersPage extends StatefulWidget {

   WorkersPage({Key? key}) : super(key: key);

  @override
  _WorkersPageState createState() => _WorkersPageState();
}

class _WorkersPageState extends State<WorkersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('user').where('status', whereIn: [2,3]).snapshots(),
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

    return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount:snapshot.data!.docs.length,
    itemBuilder: (context, int index) {
    return Padding(
    padding: const EdgeInsets.only(top: 1),
    child: GestureDetector(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsWorkers()));
    },
    child: AppContainer(

    child:ListTile(
    leading:CircleAvatar(
    backgroundColor: Colors.green,
    ),
    title: AppHeadingText(text:snapshot.data!.docs[index]['name'],),
    subtitle: AppHeadingText(text: snapshot.data!.docs[index]['mobile'],),
    ) ,

    ),
    ),
    );


    }
    );
    }
          }
        ),
      ),

    );
  }
}
