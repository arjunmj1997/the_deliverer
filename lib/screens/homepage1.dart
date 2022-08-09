import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/models/appbar.dart';
import 'package:the_deliverer/models/containerstyle.dart';
import 'package:the_deliverer/models/lists.dart';
import 'package:the_deliverer/models/models1.dart';
import 'package:the_deliverer/screens/editprofile.dart';
import 'package:the_deliverer/screens/functionlist.dart';
import 'package:the_deliverer/screens/loginpage.dart';
import 'package:the_deliverer/screens/payment.dart';
import 'package:the_deliverer/screens/paymentworkers.dart';
import 'package:the_deliverer/screens/register.dart';
import 'package:the_deliverer/screens/registerfunction.dart';
import 'package:the_deliverer/widgets/appbutton.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
import 'package:the_deliverer/widgets/recatanglebutton.dart';

import '../widgets/appnormaltext.dart';

class HomePage1 extends StatefulWidget {
  var index;
  final String? name;
   final String? mob;
   var emial;
  var  stat;
  var address;
  final String? username;
  final String? password;
  var experience;
  final String? uid;
   HomePage1({Key? key, this.name,  this.mob, this.username, this.password, this.experience, this.uid,this.stat,this.emial,this.address
   }) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  String? name;

  @override
  void initState() {
    // TODO: implement initState
    name=widget.name;
    print(name);
    super.initState();
  }

  @override
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
     AppHeadingText(text:"Email: ${widget.emial.toString()}"),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile(uid: widget.uid,)));

                 },
                child: RectangularButton(text:"EDIT",hi:30,width: 100,)),





          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
       // color: Colors.blue,
        child: SingleChildScrollView(
          child: Column(children: [
            AppBars(
              title: widget.name.toString(),

              col: Color(0xff094190),

            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.38,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Container(
                  height: 250,
                    child: Swiper(
                      itemBuilder: (context, index) {
                        final image = 'assets/images/' + imgList[index];
                        return Image.asset(
                          image,
                          fit: BoxFit.fill,
                        );
                        //borderRadius: BorderRadius.only(topRight: Radius.circular(60),topLeft:Radius.circular(60))
                      },
                      indicatorLayout: PageIndicatorLayout.COLOR,
                      autoplay: true,
                      itemCount: imgList.length,
                      pagination: const SwiperPagination(),
                      control: const SwiperControl(),
                    ))),
            // Image(image:AssetImage('assets/images/culinary-1544525__480.png'),fit: BoxFit.fill,),
            Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                height: MediaQuery.of(context).size.height *0.50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xffe7e8d1)

                  ),
                child: Stack(
                  children: [
                    Positioned(
                      top:16,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FunctionList(
                            uid: widget.uid,
                          )));
                        },
                        child: Container(
                          height: 200,
                          width: 180,

                          decoration: contsyle3,

                          child: Stack(
                            children: [
                              Positioned(
                                top: -30,
                                child: Container(
                                  height: 200,
                                  width: 180,
                                  //color: Colors.white54,
                                  child: Image.asset(
                                    'assets/images/admin.png',
                                    scale: 4,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,

left: 0,
                                child: Container(
                                  //color: Color(0xfff3ca20),
                                  color: Color(0xff094190),
                                  width: 200,
                                  height: 40,
                                  child: Center(child: Padding(
                                    padding: const EdgeInsets.only(right: 19),
                                    child: AppHeadingText(text: "Event Lists",size: 20,color: Colors.white,),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 16,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterFunction(
                            name: widget.name,
                            uid: widget.uid,
                          )));
                        },
                        child: Container(
                          height: 200,
                          width: 180,

                          decoration: contsyle3,

                          child: Stack(
                            children: [
                              Positioned(
                                top: -40,
                                child: Container(
                                  height: 200,
                                  width: 180,
                                  //color: Colors.white54,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Image.asset(
                                      'assets/images/admin.png',
                                      scale: 4,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: Container(
                                  //color: Color(0xfff3ca20),
                                  color: Color(0xff094190),
                                  width: 200,
                                  height: 40,
                                  child: Center(child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: AppHeadingText(text:"Register Function",size: 20,color: Colors.white,),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                   // top: 250,
                    bottom: 22,
                      left:0,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentWorkers(
                            payename: widget.name,
                            receiveid: widget.uid,
                          )));
                        },
                        child: ResponsiveButton(
                          width: MediaQuery.of(context).size.width*0.95,
                          hi: 66,
                          text: "Payment",
                          col: Color(0xff094190),
                          txtcolor:Colors.white,
                        ),
                      )
                  )
                  ],
                ))

            // child: Stack(
            //   children: [
            //     Positioned(
            //       left: 30,
            //     top: 35,
            //       child:Container(
            //       height: 70,
            //       width: 70,
            //       decoration: contsyle2,
            //
            //         child: Image.asset('assets/images/boy1.jpg',fit: BoxFit.fill,),
            //     ),
            //     ),
            //     Positioned(
            //       left: 155,
            //     top: 35,
            //       child:Container(
            //       height: 70,
            //       width: 70,
            //       decoration: contsyle2,
            //     ),
            //     ),
            //     Positioned(
            //       left: 280,
            //     top: 35,
            //       child:Container(
            //       height: 70,
            //       width: 70,
            //       decoration: contsyle2,
            //     ),
            //     ),
            //     Positioned(
            //       left: 280,
            //     top: 135,
            //       child:Container(
            //       height: 70,
            //       width: 70,
            //       decoration: contsyle2,
            //     ),
            //     ),
            //     Positioned(
            //       left: 155,
            //     top: 135,
            //       child:Container(
            //       height: 70,
            //       width: 70,
            //       decoration: contsyle2,
            //     ),
            //     ),
            //     Positioned(
            //       left: 30,
            //     top: 135,
            //       child:Container(
            //       height: 70,
            //       width: 70,
            //       decoration: contsyle2,
            //     ),
            //     ),
            //   ],
            // ),
          ]),
        ),
      ),
    );
  }

}
