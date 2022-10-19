



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/widgets/appbutton.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
import 'package:the_deliverer/widgets/customcard.dart';

import '../widgets/recatanglebutton.dart';
class DetailsWorkers extends StatefulWidget {
  var index;
  final String? name;
  final String? mob;
  var emial;
  var  stat;
  var address;
  final String? username;
  final String? password;
  final String? role;
  var experience;
  final String? uid;
   DetailsWorkers({Key? key, this.name, this.mob, this.username, this.password, this.role, this.uid,this
   .experience,this.emial,this.address,this.index,this.stat}) : super(key: key);

  @override
  _DetailsWorkersState createState() => _DetailsWorkersState();
}

class _DetailsWorkersState extends State<DetailsWorkers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){
              FirebaseFirestore.instance.collection('user').doc(widget.uid).update({
              'status':0
              } );

            },
              child: RectangularButton(text: "REMOVE",width:MediaQuery.of(context).size.width,size:25,txtcolor: Colors.white,)),

        ],
      ),

      appBar: AppBar(
        toolbarHeight: 78,
        backgroundColor: Color(0xff094190),
        title:Padding(
          padding: const EdgeInsets.only(right:30),
          child: Center(child: AppHeadingText(text: "Details",)),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xffe7e8d1)
        ),

        child: StreamBuilder<QuerySnapshot>(
          stream:  FirebaseFirestore.instance.collection('user').where('status',isEqualTo: {2,3}).snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top:1),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          //CustomCard(
                          // child: AppHeadingText(text:"CustomerName: ${widget.name.toString()}",color: Colors.blue,),
                          //),
                          // CustomCard(
                          // child: AppHeadingText(text:"email: ${widget.email.toString()}",color: Colors.blue,size: 5,),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(right:30),
                            child: AppHeadingText(text: "CustomerName: ${widget.name.toString()}"),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: AppHeadingText(text: "Address: ${widget.address.toString()}"),
                          ),
                          SizedBox(
                            height: 40,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left:100),
                            child: Row(
                              children: [
                                AppHeadingText(text: "Mobile",size: 28,),


                                AppHeadingText(text:":${widget.mob.toString()}",size: 28,)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: AppHeadingText(text: "Email: ${widget.emial.toString()}"),
                          ),
                          SizedBox(
                            height: 40,
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.only(left:20),
                          //   child: AppHeadingText(text: "Time: ${widget.time.toString()}"),
                          // ),


                        ],
                      ),
                    ),
                  );


                }
            );
          }
        ),
      ),
    );
  }
}
