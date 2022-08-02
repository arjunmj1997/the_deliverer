import 'package:flutter/material.dart';
import 'package:the_deliverer/models/appbar.dart';
import 'package:the_deliverer/screens/functionlist.dart';
import 'package:the_deliverer/screens/paymentworkers.dart';
import 'package:the_deliverer/widgets/appbutton.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
import 'package:the_deliverer/widgets/appnormaltext.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xff094190),
        child: Column(
          children: [
            AppHeadingText(text:"Personal details")
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Color(0xff094190),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.logout),
          )
        ],
        title: Center(child: AppHeadingText(text: "Profile",color: Colors.teal,size: 30,)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child:Stack(
            children: [
              Positioned(
                left: 125,
                  top: 50,
                  child:CircleAvatar(
                    maxRadius: 80,
                    backgroundColor: Color(0xff094190),
                  )
                  ),
              Positioned(
                left: 144,
                  top:220,
                  child:AppHeadingText(text:"Arjun MJ",size:30,color: Colors.deepPurple,)
                  ),
              Positioned(
                left: 112,
                  top:260,
                  child:AppHeadingText(text:"arj@gmail.com",size:27,color: Colors.deepPurple,)
                  ),

              Positioned(

                  top:330,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FunctionList()));
                    },
                    child: ResponsiveButton(text:"Your Program List",hi:120,width: MediaQuery.of(context).size.width,col: Color(0xff094190),txtcolor: Colors.white,
              ),
                  )
              ),

              Positioned(

                  top:466,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentWorkers()));
                    },
                      child: ResponsiveButton(text:"Payment",hi:120,width: MediaQuery.of(context).size.width,col: Color(0xff094190),txtcolor: Colors.white,))
                  ),

                ],
              )


      )


      );

  }
}
