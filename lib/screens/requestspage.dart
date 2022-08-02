import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_deliverer/screens/detailspage.dart';
import 'package:the_deliverer/screens/detailsworkers.dart';
import 'package:the_deliverer/widgets/recatanglebutton.dart';

import '../models/appcontainer.dart';
import '../widgets/appheadingtext.dart';
import 'detailsadminedit.dart';
class RequestPage extends StatefulWidget {
  final String? name;
  final String? mob;

   RequestPage({Key? key, this.name, this.mob,}) : super(key: key);

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
    color: Color(0xffe7e8d1),
    // borderRadius: BorderRadius.circular(60)
    ),
    child: StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection("user").snapshots(),
    builder: (context,snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
        return Center(
          child: Text("No data found"),
        );
      }
      else {
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 1),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => DetailsWorkers()));
                  },
                  child: AppContainer(
                    hi: 120,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.green,
                          ),
                          title: AppHeadingText(text: snapshot.data!.docs[index]['name'],),
                           subtitle:AppHeadingText(text: snapshot.data!.docs[index]['mobile'],size:20,),

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: GestureDetector(
                                  onTap: () {

                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsAdminEdit()));
                                  },
                                  child: RectangularButton(text: "CONFIRM",
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.50,
                                    size: 15,
                                    txtcolor: Colors.white,
                                    hi: 35,)),
                            ),


                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: GestureDetector(
                                  onTap: () {},
                                  child: RectangularButton(text: "DECLINE",
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.48,
                                    size: 15,
                                    txtcolor: Colors.white,
                                    hi: 35,)),
                            )
                          ],
                        ),
                      ],
                    ),

                  ),

                ),
              );
            }

        );
      }

    }
      )


    )
        );
  }
}
