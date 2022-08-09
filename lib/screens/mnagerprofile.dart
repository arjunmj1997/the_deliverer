import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/models/appbar.dart';
import 'package:the_deliverer/models/containerstyle.dart';
import 'package:the_deliverer/screens/confirmedpage.dart';
import 'package:the_deliverer/screens/detailsmanager.dart';
import 'package:the_deliverer/screens/detailspage.dart';
import 'package:the_deliverer/screens/editmanagerprofile.dart';
import 'package:the_deliverer/screens/pendingpage.dart';
import 'package:the_deliverer/screens/register.dart';
import 'package:the_deliverer/widgets/appbutton.dart';
import 'package:the_deliverer/widgets/recatanglebutton.dart';

import '../models/appcontainer.dart';
import '../widgets/appheadingtext.dart';

class ManagerProfile extends StatefulWidget {
  final String? uid;
  final String? name;
  final String? mob;
  final String? emaill;
  final String?  stat;
  final String? address;
  final String? username;
  final String? password;
  final String? experience;
  const ManagerProfile({Key? key, this.uid, this.name, this.mob, this.emaill, this.stat, this.address, this.username, this.password, this.experience, }) : super(key: key);

  @override
  _ManagerProfileState createState() => _ManagerProfileState();
}

class _ManagerProfileState extends State<ManagerProfile>
    with SingleTickerProviderStateMixin {
  late TabController _controller1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller1 = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child:Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.30,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xff094190)
                  //color: Colors.blue
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Color(0xffe7e8d1),
                      ),
                    ),
                    SizedBox(
                      height:10,
                    ),
                    AppHeadingText(text: widget.name.toString(),),
                  ],
                ),
              ),
              AppHeadingText(text:"Name: ${widget.name.toString()}"),
              AppHeadingText(text:"Mobile: ${widget.mob.toString()}"),
              AppHeadingText(text:"Email: ${widget.emaill.toString()}"),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditManagerProfile(
                    uid: widget.uid,
                  )

                  ) );},
                  child: RectangularButton(text: "EDIT",width: 100,hi: 30,))




            ],
          ),
        ),

        appBar: AppBar(
          elevation: 0,
          actions: [IconButton(onPressed: () {
            showalert(context);
          }, icon: Icon(Icons.logout))],
          title: Center(
              child: AppHeadingText(
            text: "Your List",
          )),
          backgroundColor: Color(0xff094190),
          bottom: TabBar(
            controller: _controller1,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(
                text: "PENDING",
              ),
              Tab(
                text: "CONFIRMED",
              ),
              Tab(
                text: "My Events",
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller1,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffe7e8d1),
                // borderRadius: BorderRadius.circular(60)
              ),
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("events")
                      .where('managerid', isEqualTo: widget.uid)
                      .where('managerstatus', isEqualTo: 0)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData &&
                        snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Text("No data found"),
                      );
                    } else {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: GestureDetector(
                                  onTap: () {},
                                  child: ListTile(
                                    leading: IconButton(
                                      icon: const Icon(Icons.account_box),
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('events')
                                            .doc(snapshot.data!.docs[index]
                                                ['event_id'])
                                            .update({
                                          'managerstatus': 1,
                                        });
                                      },
                                    ),
                                    title: AppHeadingText(
                                        text: snapshot.data!.docs[index]
                                            ['locationname']),
                                    subtitle: AppHeadingText(
                                      text: snapshot.data!.docs[index]['date'],
                                      size: 20,
                                    ),
                                    trailing: AppHeadingText(
                                      text: snapshot.data!.docs[index]
                                          ['regname'],
                                      size: 20,
                                    ),
                                  )),
                            );
                          });
                    }
                  }),

              // child: StreamBuilder<QuerySnapshot>(
              //   stream: FirebaseFirestore.instance.collection("events").snapshots(),
              //   builder: (context,snapshot){
              //
              //     if(!snapshot.hasData){
              //
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }
              //
              //     else if( snapshot.hasData && snapshot.data!.docs.isEmpty){
              //
              //       return Center(
              //         child: Text("No data found"),
              //       );
              //     }
              //     else{
              //       return ListView.builder(
              //           itemCount: snapshot.data!.docs.length,
              //           itemBuilder: (context,int index){
              //             return ListTile(
              //               title: Text(snapshot.data!.docs[index]['customername']),
              //               subtitle:Text(snapshot.data!.docs[index]['locationname']),
              //               trailing: RectangularButton(text: "Confirm",width: 120,hi: 50,),
              //
              //
              //
              //
              //
              //
              //             );
              //
              //
              //
              //
              //           });
              //     }
              //
              //   },
              // ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("events")
                    .where('managerid', isEqualTo: widget.uid)
                    .where('managerstatus', isEqualTo: 1)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text("No data found"),
                    );
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 1),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsManager(
                                                evid: snapshot.data!.docs[index]
                                                    ['event_id'],
                                                name: snapshot.data!.docs[index]
                                                    ['customername'],
                                                locationname:
                                                    snapshot.data!.docs[index]
                                                        ['locationname'],
                                                date: snapshot.data!.docs[index]
                                                    ['date'],
                                                address: snapshot.data!
                                                    .docs[index]['address'],
                                                time: snapshot.data!.docs[index]
                                                    ['time'],
                                                email: snapshot
                                                    .data!.docs[index]['email'],
                                                mobile: snapshot.data!
                                                    .docs[index]['mobile'],
                                                check: snapshot
                                                    .data!.docs[index]['type2'],
                                                radio:
                                                    snapshot.data!.docs[index]
                                                        ['vegornonvegstatus'],
                                              )));
                                },
                                child: ListTile(
                                  title: AppHeadingText(
                                      text: snapshot.data!.docs[index]
                                          ['locationname']),
                                  subtitle: AppHeadingText(
                                    text: snapshot.data!.docs[index]['date'],
                                    size: 20,
                                  ),
                                  trailing: AppHeadingText(
                                    text: snapshot.data!.docs[index]['regname'],
                                    size: 20,
                                  ),
                                )),
                          );
                        });
                  }
                }),

            Text("hello"),

            // StreamBuilder<QuerySnapshot>(
            //     stream: FirebaseFirestore.instance.collection("events").where('registeredby',isEqualTo:widget.uid).snapshots(),
            //     builder: (context, snapshot) {
            //       if (!snapshot.hasData) {
            //         return Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            //         return Center(
            //           child: Text("No data found"),
            //         );
            //       } else {
            //         return ListView.builder(
            //             scrollDirection: Axis.vertical,
            //             itemCount: snapshot.data!.docs.length,
            //             itemBuilder: (context, int index) {
            //               return Padding(
            //                 padding: const EdgeInsets.only(top: 1),
            //                 child: GestureDetector(
            //                     onTap: () {
            //                       Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                               builder: (context) => DetailsPage()));
            //                     },
            //                     child: ListTile(
            //                       leading: CircleAvatar(
            //                         backgroundColor: Color(0xff094190),
            //                       ),
            //                       title: AppHeadingText(
            //                           text: snapshot.data!.docs[index]['locationname']
            //
            //                       ),
            //                       subtitle: AppHeadingText(text:snapshot.data!.docs[index]['date'] ,size: 20,),
            //                       trailing: AppHeadingText(text:snapshot.data!.docs[index]['regname'] ,size: 20,),
            //                     )
            //
            //                 ),
            //               );
            //
            //             });
            //       }
            //     }),
          ],
        ));
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
