

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_deliverer/models/appbar.dart';
import 'package:the_deliverer/screens/homepage1.dart';
import 'package:the_deliverer/screens/listpage.dart';
import 'package:the_deliverer/screens/manager.dart';
import 'package:the_deliverer/screens/payment.dart';
import 'package:the_deliverer/screens/paymentworkers.dart';
import 'package:the_deliverer/screens/register.dart';
import 'package:the_deliverer/screens/registerfunction.dart';
import 'package:the_deliverer/screens/registermanager.dart';
import 'package:the_deliverer/screens/requestspage.dart';
import 'package:the_deliverer/screens/searchpage.dart';
import 'package:the_deliverer/screens/workerspage.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
import 'package:the_deliverer/widgets/recatanglebutton.dart';
class AdminPage extends StatefulWidget {
  final String? name;
  final String? uid;
  final String? role;
  final String? adid;
  const AdminPage({Key? key, this.name, this.uid, this.role, this.adid}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage>with SingleTickerProviderStateMixin {
  late TabController _controller;
  var name="Admin";
  var regkey= GlobalKey<FormState>();
  TextEditingController datecontroller= TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=TabController(length:3, vsync:this,initialIndex:0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child:Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff42f5a7),
            Color(0xffe7e8d1)
          ]),
        ),

        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.only(left:8,top: 50),

               child: CircleAvatar(
                radius: 60,
                backgroundColor: Color(0xffe7e8d1),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AppHeadingText(text: "Arjun"),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

               // RectangularButton(text: "EDIT",width:100,hi: 30,),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                  },
                    child: RectangularButton(text: "LOGOUT",width:100,hi: 30,)),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterFunction(
                  name: name,
                )));
              },
                child : RectangularButton(text: "Register Function",width: 200,hi: 30,)),
                 SizedBox(
                   height: 10,
                 ),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterManager()));
                   },
                     child: RectangularButton(text: "Register Manager",width: 200,hi: 30,)),
                 SizedBox(
                   height: 10,
                 ),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>ManagerPage()));
                   },
                     child: RectangularButton(text: "View Managers",width: 200,hi: 30,)),
                 SizedBox(
                   height: 10,
                 ),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentWorkers(
                       payename: widget.name,
                       receiveid: 'admin123',
                       adname: widget.name

                     )));
                   },
                     child: RectangularButton(text: "Payment",width: 200,hi: 30,)),


          ],
        ),
      ),
      ),
      appBar: AppBar(
        backgroundColor:Color(0xff094190),
        toolbarHeight: 80,
        actions: [
          SizedBox(
            width: 200,
            height: 200,
            child: Form(
              key: regkey,
              child: TextFormField(

                validator: (value){

                  if(value==null|| value.isEmpty){
                    return "field should not empty";
                  }
                  if(value.length<2){
                    return "enter valid";
                  }
                },
                keyboardType: TextInputType.text,
                controller: datecontroller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                      const BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Enter Date",
                   // prefixIcon: Icon(Icons.account_circle_sharp),
                    hintStyle: TextStyle(color: Colors.black54,fontSize: 15,fontWeight: FontWeight.bold),
                    suffixIcon:IconButton(
                        onPressed:(){
                          if(regkey.currentState!.validate())
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchPage(
                                    date: datecontroller.text,)));
                        },
                        icon:Icon(Icons.search)
                    )
                ),

              ),
            ),
          ),
          //IconButton(onPressed:(){}, icon:Icon(Icons.search)),

        ],
        title:AppHeadingText(text: "Welcome Arjun",size: 15,color: Colors.white,),


        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              text: "LIST",

            ),
            Tab(
              text: "WORKERS",
            ),
            Tab(
              text: "REQUESTS",
            ),


          ],
        ),
    ),


      body: TabBarView(
        controller: _controller,
        children: [

              ListPage(
                name: name,
                adid: widget.adid,
              ),

         WorkersPage(),
          RequestPage(),




        ],)


        //color: Colors.blue,
    );
  }
}
