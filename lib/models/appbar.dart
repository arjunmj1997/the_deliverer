import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/widgets/appnormaltext.dart';

import '../widgets/appheadingtext.dart';
class AppBars extends StatefulWidget {
  final double? ele;
  final Color? col;
  final double? hi;
  String? title;


   AppBars({Key? key, this.ele, this.col=Colors.blue, this.hi,this.title
   }) : super(key: key);

  @override
  State<AppBars> createState() => _AppBarsState();
}

class _AppBarsState extends State<AppBars> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:widget.col,
      elevation: widget.ele,
      toolbarHeight: widget.hi,
      actions: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: (){
              showalert(context);

            },
              child: Icon(Icons.logout)),

        ),


      ],
      title:Text("Welcome ${widget.title.toString()}")

    );
  }
  void showalert(BuildContext context)  {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Do you want to Logout?"),
            content: Text("Are you sure"),
            actions: [
              ElevatedButton(onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              }, child: Text("Yes")),
              ElevatedButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text("Cancel"))
            ],
          );
        });
  }

}
