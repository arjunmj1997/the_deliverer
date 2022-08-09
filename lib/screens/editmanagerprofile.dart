import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:the_deliverer/screens/homepage1.dart';
import 'package:the_deliverer/validation.dart';
import 'package:the_deliverer/widgets/appbutton.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
import 'package:the_deliverer/widgets/appnormaltext.dart';
class EditManagerProfile extends StatefulWidget {
  final String? uid;
  const EditManagerProfile({Key? key, this.uid}) : super(key: key);

  @override
  _EditManagerProfileState createState() => _EditManagerProfileState();
}

class _EditManagerProfileState extends State<EditManagerProfile> {
  //controller declaration for Textform fields
  TextEditingController namecontroller= TextEditingController();
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController mobilenumcontroller= TextEditingController();
  TextEditingController passwordcontroller= TextEditingController();
  TextEditingController confirmpasscontroller= TextEditingController();
  TextEditingController usernamecontroller= TextEditingController();
  TextEditingController addressController= TextEditingController();
  TextEditingController experienceController= TextEditingController();
  TextEditingController ageController= TextEditingController();
  var regkey= GlobalKey<FormState>();
  var district;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height:MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Form(
              key: regkey,
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
                        AppHeadingText(text: "Register",size: 50,color: Colors.blue,fw:FontWeight.normal,),
                        SizedBox(height: 20,),
                        AppNormalText(text:"Please enter details to Register",color: Colors.indigo,size: 16,fw: FontWeight.normal,),
                        SizedBox(height: 20,),
                        //form fields start here
                        TextFormField(
                          validator: (value){
                            return Validate.namevalidator(namecontroller.text);
                          },
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
                          validator: (value){
                            return Validate.emailValidator(emailcontroller.text);
                          },
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
                        TextFormField(

                          keyboardType: TextInputType.phone,
                          controller: ageController,
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

                              hintText: "age",
                              prefixIcon: Icon(Icons.accessibility_new_sharp),
                              hintStyle: TextStyle(color: Colors.black54)),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                            validator: (value){
                              return Validate.namevalidator(addressController.text);
                            },
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
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(bottom: 74),
                                child: Icon(Icons.account_box_outlined),
                              ),
                            )
                          //labelText: "Address",


                        ),
                        SizedBox(
                          height: 10,
                        ),
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

                        TextFormField(
                          validator: (value){
                            if (value=="") {
                              return null;
                            }

                            return Validate.phonevalidator(mobilenumcontroller.text);
                          },
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
                          controller: usernamecontroller,
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
                              hintText: "username",
                              hintStyle: TextStyle(color: Colors.black54),
                              prefixIcon: Icon(Icons.account_box_outlined)
                          ),

                        ),


                        SizedBox(height: 10,),
                        TextFormField(
                          validator: (value){
                            return Validate.passwordvalidator(passwordcontroller.text);
                          },
                          obscureText: true,
                          keyboardType: TextInputType.phone,
                          controller: passwordcontroller,
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
                              hintText: "password",
                              hintStyle: TextStyle(color: Colors.black54),
                              prefixIcon: Icon(Icons.lock)
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          validator: (value){
                            return Validate.confirmpwdvalidator(confirmpasscontroller.text,passwordcontroller.text);
                          },
                          keyboardType: TextInputType.phone,
                          controller: confirmpasscontroller,
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
                              hintText: "confirmpassword",
                              hintStyle: TextStyle(color: Colors.black54),
                              prefixIcon: Icon(Icons.lock)
                          ),
                        ),
                        TextFormField(
                          validator: (value) {

                            if (value == null || value.isEmpty) {
                              return "Enter experience";
                            }
                          },
                          maxLines: 5,
                          keyboardType: TextInputType.phone,
                          controller: experienceController,
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
                              hintText: "experience",
                              hintStyle: TextStyle(color: Colors.black54),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(bottom:74),
                                child: Icon(Icons.rectangle_outlined),
                              )
                          ),
                        ),
                        SizedBox(height: 30,),


                        GestureDetector(
                            onTap: () {
                              if (regkey.currentState!.validate()) {
                                //FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcontroller.text.trim(), password: passwordcontroller.text.trim()).

                                    FirebaseFirestore.instance.collection("Login").doc(widget.uid).update({

                                  'name':namecontroller.text,
                                  'email':emailcontroller.text,
                                  'password':passwordcontroller.text,


                                }).then((value) => FirebaseFirestore.instance.collection('manager').doc(widget.uid).update({

                                  'name':namecontroller.text,
                                  'email':emailcontroller.text,
                                  'password':passwordcontroller.text,

                                  'address':addressController.text,
                                  'mobile':mobilenumcontroller.text,
                                  'username':usernamecontroller.text,
                                  'experience':experienceController.text,
                                  'district':district,



                                  'createdAt':DateTime.now(),
                                  'updatedAt':null,



                                }).then((value) => print("edited")) );
                                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminPage()));
                              }

                            },
                            child: ResponsiveButton(text:"EDIT",width: MediaQuery.of(context).size.width,txtcolor: Colors.white,)),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: ResponsiveButton(text:"BACK",width: MediaQuery.of(context).size.width,txtcolor: Colors.white,)),

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
