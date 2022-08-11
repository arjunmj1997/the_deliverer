import 'package:flutter/material.dart';
class ShowTraansaction extends StatefulWidget {
  const ShowTraansaction({Key? key}) : super(key: key);

  @override
  _ShowTraansactionState createState() => _ShowTraansactionState();
}

class _ShowTraansactionState extends State<ShowTraansaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xff094190),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

        ),
      ),
    );
  }
}
