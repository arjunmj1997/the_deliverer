import 'package:flutter/material.dart';

import '../widgets/appheadingtext.dart';
class ConfirmedPage extends StatefulWidget {
  const ConfirmedPage({Key? key}) : super(key: key);

  @override
  _ConfirmedPageState createState() => _ConfirmedPageState();
}

class _ConfirmedPageState extends State<ConfirmedPage> {
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
