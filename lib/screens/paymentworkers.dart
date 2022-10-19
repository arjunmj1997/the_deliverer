

import 'package:flutter/material.dart';
import 'package:the_deliverer/models/containerstyle.dart';
import 'package:the_deliverer/models/listview.dart';
import 'package:the_deliverer/screens/personpayment.dart';
import 'package:the_deliverer/screens/sendhistory.dart';
import 'package:the_deliverer/screens/userslist.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
import 'package:the_deliverer/widgets/customdrawer.dart';

import '../models/appcontainer.dart';
import '../widgets/appnormaltext.dart';
class PaymentWorkers extends StatefulWidget {
  final String? payename;
  final String? receiveid;
  final String? role;
  final String? adid;
  final String? mid;
  final String? adname;
  const PaymentWorkers({Key? key, this.payename, this.receiveid, this.role, this.adid, this.mid, this.adname}) : super(key: key);

  @override
  _PaymentWorkersState createState() => _PaymentWorkersState();
}

class _PaymentWorkersState extends State<PaymentWorkers> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xff094190),

      ),


         body:SafeArea(
         // height: double.infinity,
         // width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [

                Align(
                    alignment: Alignment.topLeft,
                    child: AppHeadingText(text:"Payments",size:30,)
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>UserList(
                            payename: widget.payename,
                            receiveid: widget.receiveid,

                          )));
                        },
                        child: Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(

                              gradient: LinearGradient(colors: [
                                // Color(0xff9542f5),

                                Color(0xff0d87d4),
                                Color(0xff42b0f5),

                              ]),
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/moneypay.jpg"),
                                  fit: BoxFit.fill
                              )
                          ),
                          child:Align(
                            alignment: Alignment.bottomLeft,
                            child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(left: 8.0,),
                                child: AppNormalText(text:"TO",size: 30,color:Colors.black,fw: FontWeight.normal,),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: AppNormalText(text:"Person",size: 26,color:Colors.black,fw: FontWeight.normal,),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),

                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonPay(
                            payename: widget.payename,
                            payid: widget.receiveid,
                            receiveid: 'admin123',
                            receivename: 'Admin',

                          )));
                        },
                        child: Container(
                          height: 200,
                          width: 300,
                          decoration:BoxDecoration(

                              gradient: LinearGradient(colors: [
                                // Color(0xff9542f5),

                                Color(0xff0d87d4),
                                Color(0xff42b0f5),

                              ]),
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/moneypay2.jpg"),
                                  fit: BoxFit.fill
                              )
                          ),
                          child:  Align(
                            alignment: Alignment.bottomLeft,
                            child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(left: 8.0,),
                                child: AppNormalText(text:"TO",size: 30,color:Colors.black,fw: FontWeight.normal,),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: AppNormalText(text:"Company",size: 26,color:Colors.black,fw: FontWeight.normal,),
                              ),
                            ),
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top:10,left: 8),
                      child: Row(
                        children: [
                          AppHeadingText(text: "Recieve History", ),
                          SizedBox(width: 15,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SendHistory(
                                        name: widget.payename,
                                        uid: widget.receiveid,
                                        role: widget.role,
                                      )));
                            },
                              child: AppHeadingText(text: "Send History", )),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: ListViews(
                    name: widget.payename,
                    uid: widget.receiveid,
                    role: widget.role,
                    adid: widget.adid,
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
  void showdrawer(){
    Drawers();
  }
}
