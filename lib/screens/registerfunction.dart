import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/screens/homepage1.dart';
import 'package:the_deliverer/widgets/appsubheadinhtext.dart';
import 'package:uuid/uuid.dart';

import '../validation.dart';
import '../widgets/appbutton.dart';
import '../widgets/appheadingtext.dart';
import '../widgets/appnormaltext.dart';

class RegisterFunction extends StatefulWidget {
  String? uid;
  String? name;


   RegisterFunction({Key? key,this.name,this.uid}) : super(key: key);

  @override
  _RegisterFunctionState createState() => _RegisterFunctionState();
}

class _RegisterFunctionState extends State<RegisterFunction> {
  var uuid = Uuid();
  var eid;
  var district;


  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController mobilenumcontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController functioncontroller = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String? option1;
  String? option2;
  bool? buffet = false;
  bool ?traditional = false;
  String? type;
  var _value;
  var regfnkey = GlobalKey<FormState>();
  @override
  void initState() {
    eid = uuid.v1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Form(
              key: regfnkey,
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
                        AppHeadingText(
                          text: "Register",
                          size: 50,
                          color: Colors.blue,
                          fw: FontWeight.normal,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppNormalText(
                          text: "Please enter details to Register",
                          color: Colors.indigo,
                          size: 16,
                          fw: FontWeight.normal,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //form fields start here
                        TextFormField(
                          textCapitalization: TextCapitalization.words,
                          validator: (value) {
                            return Validate.namevalidator(namecontroller.text);
                          },
                          keyboardType: TextInputType.text,
                          controller: namecontroller,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: "customername",
                              prefixIcon: Icon(Icons.account_circle_sharp),
                              hintStyle: TextStyle(color: Colors.black54)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (value) {
                            return Validate.emailValidator(
                                emailcontroller.text);
                          },
                          keyboardType: TextInputType.phone,
                          controller: emailcontroller,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: "email",
                              prefixIcon: Icon(Icons.email),
                              hintStyle: TextStyle(color: Colors.black54)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                         // keyboardType: TextInputType.text,
                            textAlignVertical: TextAlignVertical.bottom,
                            controller: addressController,
                            maxLines: 5,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.blue)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.red)),

                              hintText: "Address",

                              prefixIcon: Padding(
                                padding: EdgeInsets.only(bottom: 74),
                                child: Icon(Icons.account_circle_sharp),
                              ),
                              //labelText: "Address",
                            )),

                        TextFormField(
                          validator: (value) {
                            return Validate.phonevalidator(
                                mobilenumcontroller.text);
                          },
                          keyboardType: TextInputType.phone,
                          controller: mobilenumcontroller,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: "mobile",
                              hintStyle: TextStyle(color: Colors.black54),
                              prefixIcon: Icon(Icons.phone_android)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // TextFormField(
                        //   validator: (value) {
                        //     return Validate.namevalidator(
                        //         functioncontroller.text);
                        //   },
                        //   keyboardType: TextInputType.text,
                        //   controller: functioncontroller,
                        //   decoration: InputDecoration(
                        //       enabledBorder: UnderlineInputBorder(
                        //         borderSide: const BorderSide(
                        //             width: 1, color: Colors.blue),
                        //         borderRadius: BorderRadius.circular(5),
                        //       ),
                        //       focusedBorder: UnderlineInputBorder(
                        //         borderSide: const BorderSide(
                        //             width: 1, color: Colors.red),
                        //         borderRadius: BorderRadius.circular(5),
                        //       ),
                        //       hintText: "District",
                        //       hintStyle: TextStyle(color: Colors.black54),
                        //       prefixIcon: Icon(Icons.add_location)),
                        // ),
                        DropdownButtonFormField<String>(
                          value: district,
                          decoration: InputDecoration(
                            hintText: "district",

                            //suffixIcon: Icon(Icons.panorama_fish_eye),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onChanged: (ctgry) =>
                              setState(() => district = ctgry),
                          validator: (value) => value == null ? 'field required' : null,
                          items: ['palakkad', 'malappuram', 'thrissur', 'kollam', 'kottayam', 'ernakulam','alappuzha','pathanamthitta','trivandrum','idukki','wayanad','kozhikkode','kannur','kasargod']
                              .map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                        ),


                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: false,
                          keyboardType: TextInputType.phone,
                          controller: timecontroller,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: "Time",
                              hintStyle: TextStyle(color: Colors.black54),
                              prefixIcon: Icon(Icons.punch_clock_rounded)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter number";
                            }
                            return null;
                            //return Validate.usernameValidator(usernameControler.text);
                          },
                          keyboardType: TextInputType.phone,
                          controller: numbercontroller,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: "Enter Number of workers",
                              hintStyle: TextStyle(color: Colors.black54),
                              prefixIcon: Icon(Icons.keyboard_hide_outlined)),
                        ),
                        TextFormField(

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter date";
                            }
                            return null;
                            //return Validate.usernameValidator(usernameControler.text);
                          },
                          keyboardType: TextInputType.text,
                          controller: dateController,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: "Date",
                              hintStyle: TextStyle(color: Colors.black54),
                              prefixIcon: Icon(Icons.calendar_view_month)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Checkbox(
                                      value: buffet,
                                      onChanged: (value) {
                                        setState(() {
                                          buffet = value;
                                        });
                                        if (buffet == true) {
                                          option1 = "buffet";
                                        }
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: AppSubHeadingText(text: "Buffet"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Checkbox(
                                      value: traditional,
                                      onChanged: (value) {
                                        setState(() {
                                          traditional = value!;
                                        });

                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: AppSubHeadingText(text: "Traditional"),
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
                                left: 175,
                                child: Radio(
                                    value: 'veg',
                                    groupValue: _value,
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value;
                                      });
                                    }),
                              ),
                              Positioned(
                                  left: 220,
                                  top: 13,
                                  child: AppNormalText(
                                    text: "Veg",
                                    size: 15,
                                  )),
                              Positioned(
                                left: 26,
                                child: Radio(
                                    value: "non-veg",
                                    groupValue: _value,
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value;
                                      });
                                    }),
                              ),
                              Positioned(
                                  left: 70,
                                  top: 13,
                                  child: AppNormalText(
                                    text: "Non veg",
                                    size: 15,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        InkWell(
                            onTap: () {
                              if (regfnkey.currentState!.validate()){}
                              if (buffet == true || traditional==true) {

                                if (traditional == true) {
                                  option2 = "traditional";
                                }
                                if (buffet == true) {
                                  option1 = "Buffet";
                                }
                                print(option1);
                                if (regfnkey.currentState!.validate()) {
                                  FirebaseFirestore.instance
                                      .collection('events')
                                      .doc(eid)
                                      .set({
                                    'event_id': eid,
                                    'customername': namecontroller.text,
                                    'email': emailcontroller.text,
                                    'address': addressController.text,
                                    'mobile': mobilenumcontroller.text,
                                    'locationname': functioncontroller.text,
                                    'time': timecontroller.text,
                                    'numberworkers': numbercontroller.text,
                                    'date': dateController.text,
                                    'type1': option1,
                                    'type2': option2,
                                    'vegornonvegstatus': _value,
                                    'createdAt': DateTime.now(),
                                    'registeredby':widget.uid,
                                    'regname':widget.name,
                                    'managername':null,
                                    'managerid':null,
                                    'managercontactno':null,
                                    'managerstatus':0,
                                    'locationname':district,
                                    'userstatus':0,
                                    'assignid':null,



                                    'status': 1
                                  }).then((value) => print('svaed'));
                                }
                              }
                            },
                            child: ResponsiveButton(
                              text: "SAVE",
                              width: MediaQuery.of(context).size.width,
                              txtcolor: Colors.white,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage1()));
                            },
                            child: ResponsiveButton(
                              text: "BACK",
                              width: MediaQuery.of(context).size.width,
                              txtcolor: Colors.white,
                            )),
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
