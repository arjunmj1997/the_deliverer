import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:the_deliverer/models/appcontainer.dart';

import '../widgets/appheadingtext.dart';
import 'containerstyle.dart';
class ListViews extends StatefulWidget {
  const ListViews({Key? key}) : super(key: key);

  @override
  _ListViewsState createState() => _ListViewsState();
}

class _ListViewsState extends State<ListViews> {
  @override
  Widget build(BuildContext context) {

        return Container(
          height: 300,
          width: MediaQuery
              .of(context)
              .size
              .width,
          // decoration: BoxDecoration(
          //
          //     color: Colors.white,
          //
          //
          //    borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          //     border: Border.all(color: Colors.blue, width:1)
          // ),


              child:ListView.builder(
                itemCount:10,
                  scrollDirection:Axis.vertical,
                  itemBuilder:(context,int index){
                  return Padding(
                    padding: const EdgeInsets.only(top: 0,),
                    child: Container(
                      height: 80,
                      width:MediaQuery.of(context).size.width*0.95,
                      decoration: BoxDecoration(
                          // gradient: LinearGradient(colors: [
                          //   // Color(0xff9542f5),
                          //
                          //   Color(0xff0d87d4),
                          //   Color(0xff42b0f5),
                          //
                          // ]),
                         borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue,width:1),


                      ),
                    ),
                  );

                  }
              ),
        );



  }
}
