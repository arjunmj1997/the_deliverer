import 'package:flutter/material.dart';
class Drawers extends StatefulWidget {
  const Drawers({Key? key}) : super(key: key);

  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
          height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width*0.50,
         color: Colors.green,


      ),
    );
  }
}
