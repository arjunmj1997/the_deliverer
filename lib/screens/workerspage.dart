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
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
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
                  title: AppHeadingText(text: "Hello",),
                ) ,

              ),
            ),
          );


        }
    ),

    );
  }
}
