import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
class ManagerPage extends StatefulWidget {
  const ManagerPage({Key? key}) : super(key: key);

  @override
  _ManagerPageState createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff094190),
        title: Center(child: AppHeadingText(text: "Managers",)),
      ),
     body: Container(
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
       child: StreamBuilder<QuerySnapshot>(
         stream: FirebaseFirestore.instance.collection('manager').snapshots(),
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
             itemCount: snapshot.data!.docs.length,
               itemBuilder:(Context,int index){
               return ListTile(
                 leading: CircleAvatar(
                   backgroundColor: Color(0xff094190),
                 ),

                 title: AppHeadingText(text:snapshot.data!.docs[index]['name'] ,),
                 subtitle: AppHeadingText(text: snapshot.data!.docs[index]['mobile'] ,),

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
