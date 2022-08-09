import 'package:flutter/material.dart';
import 'package:the_deliverer/models/containerstyle.dart';
import 'package:the_deliverer/models/listview.dart';
import 'package:the_deliverer/screens/addpaying.dart';
import 'package:the_deliverer/screens/personpayment.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';

import '../models/appcontainer.dart';
import '../widgets/appnormaltext.dart';
class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
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
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonPay()));
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
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPaying()));
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
                                  image: AssetImage("assets/images/moneypay1.jpg"),
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
                                child: AppNormalText(text:"Self",size: 26,color:Colors.black,fw: FontWeight.normal,),
                              ),
                            ),
                          ),
                          ),
                      ),
                      SizedBox(
                        width: 10
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPaying()));
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
               child: AppHeadingText(text: "Transactions", ),
             )),
                SizedBox(
                  height: 10,
                ),
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: ListViews(),
            )
              ],
    ),
          ),
        ),
      )
    );
  }
}
