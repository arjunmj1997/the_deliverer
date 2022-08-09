import 'package:flutter/material.dart';

import 'appheadingtext.dart';
class CustomCard extends StatefulWidget {
  final Widget? child;
  const CustomCard({Key? key, this.child}) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation:20,
        // shadowColor: Colors.grey,
       // semanticContainer: true,
        color: Colors.grey,

      ),
    );
  }
}
