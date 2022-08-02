import 'package:flutter/material.dart';

import '../widgets/appheadingtext.dart';
class PendingPage extends StatefulWidget {
  final String? custname;
  var  mob;
  var  stat;
  final String? locaname;
  final String? time;
  final String? date;
  final String? uid;
   PendingPage(then, {Key? key, this.custname, this.locaname, this.time, this.date, this.uid}) : super(key: key);

  @override
  _PendingPageState createState() => _PendingPageState();
}

class _PendingPageState extends State<PendingPage> {
  String? name;
  @override
  void initState() {
    // TODO: implement initState
    name=widget.locaname;
    print(name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child:ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount:10,
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width*0.50,
                  decoration: BoxDecoration(
                      color: Color(0xffe7e8d1),
                      borderRadius: BorderRadius.circular(60)
                  ),
                  child:ListTile(

                    title: AppHeadingText(text: "Hello",),
                  ) ,

                ),
              );


            }
        ),

      ),
    );
  }
}
