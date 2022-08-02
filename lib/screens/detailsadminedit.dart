

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/models/appbar.dart';
import 'package:the_deliverer/screens/homepage1.dart';
import 'package:the_deliverer/widgets/appsubheadinhtext.dart';

import '../widgets/appbutton.dart';
import '../widgets/appheadingtext.dart';
import '../widgets/appnormaltext.dart';
class DetailsAdminEdit extends StatefulWidget {
  const DetailsAdminEdit({Key? key}) : super(key: key);

  @override
  _DetailsAdminEditState createState() => _DetailsAdminEditState();

}

class _DetailsAdminEditState extends State<DetailsAdminEdit> {
  TextEditingController namecontroller= TextEditingController();
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController mobilenumcontroller= TextEditingController();
  TextEditingController timecontroller= TextEditingController();
  TextEditingController numbercontroller= TextEditingController();
  TextEditingController functioncontroller= TextEditingController();
  TextEditingController addressController= TextEditingController();
  TextEditingController dateController= TextEditingController();
  bool value1=false;
  bool value2=false;
  String? type;
  var _value;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff094190),
      ),
      body: SafeArea(
        child: Container(
          height:MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Form(
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        //form fields start here
                          TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: namecontroller,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                const BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: "name",
                              prefixIcon: Icon(Icons.account_circle_sharp),
                              hintStyle: TextStyle(color: Colors.black54)),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(

                          keyboardType: TextInputType.phone,
                          controller: emailcontroller,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                const BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(5),
                              ),

                              hintText: "email",
                              prefixIcon: Icon(Icons.email),
                              hintStyle: TextStyle(color: Colors.black54)),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                            textAlignVertical: TextAlignVertical.bottom,
                            controller: addressController,
                            maxLines: 5,
                            decoration:const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width:1,color: Colors.blue)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width:1,color: Colors.red)
                              ),

                              hintText: "Address",

                              prefixIcon:
                              Padding(
                                padding: EdgeInsets.only(bottom:74),
                                child: Icon(Icons.account_circle_sharp),
                              ),
                              //labelText: "Address",

                            )



                        ),


                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: mobilenumcontroller,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                const BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: "mobile",
                              hintStyle: TextStyle(color: Colors.black54),
                              prefixIcon: Icon(Icons.phone_android)
                          ),

                        ),
                        SizedBox(
                          height: 10,),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: functioncontroller,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                const BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: "Location Name",
                              hintStyle: TextStyle(color: Colors.black54),
                              prefixIcon: Icon(Icons.add_location)
                          ),

                        ),


                        SizedBox(height: 10,),
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.phone,
                          controller: timecontroller,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                const BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: "Time",
                              hintStyle: TextStyle(color: Colors.black54),
                              prefixIcon: Icon(Icons.punch_clock_rounded)
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: numbercontroller,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder:UnderlineInputBorder(
                                borderSide:
                                const BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: "Enter Number of workers",
                              hintStyle: TextStyle(color: Colors.black54),
                              prefixIcon: Icon(Icons.keyboard_hide_outlined)
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: dateController,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder:UnderlineInputBorder(
                                borderSide:
                                const BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: "Date",
                              hintStyle: TextStyle(color: Colors.black54),
                              prefixIcon: Icon(Icons.calendar_view_month)
                          ),
                        ),
                        SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(

                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(left:5),
                                  child: Checkbox(

                                      value: value1,
                                      onChanged: (value){

                                        if(value2==false){
                                          setState(() {
                                            this.value1=value!;
                                          });
                                        }



                                      }
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:10),
                                  child: AppSubHeadingText(text:"Buffet"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:50),
                                  child: Checkbox(
                                      value:value2,
                                      onChanged: (value){

                                        if(value1==false){
                                          setState(() {
                                            this.value2=value!;
                                          });
                                        }

                                      }
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:5),
                                  child: AppSubHeadingText(text:"Traditional"),
                                ),

                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.end,
                                //   children: [
                                //
                                //     SizedBox(width: 150,),
                                //      GestureDetector(
                                //
                                //          onTap: (){
                                //            if(value1==true){
                                //              type="Buffet";
                                //            }
                                //            else
                                //              type="Traditional";
                                //            print(type);
                                //             Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage1() ,
                                //
                                //              ));
                                //       },
                                //          child: ResponsiveButton(text: "Next",width: 200,)),
                                //    ],
                                // )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Positioned(
                                left:175,
                                child: Radio(
                                    value:1 ,
                                    groupValue:_value ,
                                    onChanged:(value){
                                      setState(() {
                                        _value= value;
                                      });
                                    }
                                ),
                              ),
                              Positioned(
                                  left: 220,
                                  top: 13,
                                  child: AppNormalText(text:"Veg",size: 15,)),
                              Positioned(
                                left:26,

                                child: Radio(
                                    value:2 ,
                                    groupValue:_value ,
                                    onChanged:(value){
                                      setState(() {
                                        _value= value;
                                      }

                                      );
                                    }
                                ),
                              ),
                              Positioned(
                                  left: 70,
                                  top: 13,
                                  child: AppNormalText(text:"Non veg",size: 15,))

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ResponsiveButton(text:"SAVE",width: MediaQuery.of(context).size.width,txtcolor: Colors.white,)

                      ],
                    ),
                  )
                ],

              ),

            ),
          ),
        ),
      ),
    );
  }
}
