import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:the_deliverer/screens/adminpage.dart';
import 'package:the_deliverer/screens/homepage1.dart';
import 'package:the_deliverer/screens/manager.dart';
import 'package:the_deliverer/screens/mnagerprofile.dart';
import 'package:the_deliverer/screens/profilepage.dart';
import 'package:the_deliverer/screens/register.dart';
import 'package:the_deliverer/widgets/appbutton.dart';
import 'package:the_deliverer/widgets/appheadingtext.dart';
import 'package:the_deliverer/widgets/appnormaltext.dart';
import 'package:the_deliverer/widgets/appsubheadinhtext.dart';

import '../validation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameControler = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var error;
  var loginkey = new GlobalKey<FormState>();
  bool? checked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/loginimg1.jpg"),
                  fit: BoxFit.fill)),
          child: Center(
            child: Form(
              key: loginkey,
              child: SingleChildScrollView(
                child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppHeadingText(
                      text: 'Login',
                      color: Colors.blue,
                      size: 70,
                    ),

                    // Image.asset(
                    //   'assets/images/circularimg-removebg-preview.png',
                    //   width: 150,
                    //   height: 150,
                    //   fit: BoxFit.fill,
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    // Text("Hello Again!",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 28),),

                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                      child: TextFormField(
                        style: TextStyle(color: Colors.red),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a valid username";
                          }
                          return null;
                          //return Validate.usernameValidator(usernameControler.text);
                        },
                        // keyboardType: TextInputType.phone,
                        controller: usernameControler,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.blue),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.blue),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: "Username",
                            hintStyle: TextStyle(color: Colors.blue)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                      child: TextFormField(
                        style: TextStyle(color: Colors.red),
                        validator: (value) {
                          // if (value == null || value.isEmpty) {
                          //   return "Enter a valid password";
                          // } else if (value.length < 8) {
                          //   return "Password must be 8 characters";
                          // } else
                          // return null;
                          return Validate.passwordvalidator(
                              passwordController.text);
                        },
                        controller: passwordController,
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              fillColor: MaterialStateProperty.all(Colors.blue),
                              // activeColor: Colors.red,
                              // hoverColor: Colors.red,
                              value: checked,
                              onChanged: (value) {
                                setState(() {
                                  checked = value;
                                });
                              }),
                          SizedBox(
                            width: 2,
                          ),
                          AppNormalText(
                            text: "Accept Terms and Conditions",
                            fw: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    checked == true
                        ? GestureDetector(
                            onTap: () {
                              if (loginkey.currentState!.validate()) {
                                if (usernameControler.text ==
                                        "admin@gmail.com" &&
                                    passwordController.text == "admin12345") {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AdminPage(
                                                name: "Admin",
                                                adid: "ad123id",
                                              )));
                                } else {
                                  FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: usernameControler.text,
                                          password: passwordController.text)
                                      .then((user) => FirebaseFirestore.instance
                                              .collection('Login')
                                              .doc(user.user!.uid)
                                              .get()
                                              .then((value) {
                                            if (value.data()!['userrole'] ==
                                                "user") {
                                              FirebaseFirestore.instance
                                                  .collection('user')
                                                  .doc(user.user!.uid)
                                                  .get()
                                                  .then((value) {
                                                print("helo");
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage1(
                                                      name:
                                                          value.data()!['name'],
                                                      mob: value
                                                          .data()!['mobile'],
                                                      emial: value
                                                          .data()!['email'],
                                                      uid: value.data()!['uid'],
                                                      role: value
                                                          .data()!['userrole'],
                                                    ),
                                                  ),
                                                );

                                                // else{
                                                //   Fluttertoast.showToast(
                                                //     msg: 'Invalid user name or password',
                                                //     toastLength: Toast.LENGTH_LONG,
                                                //     fontSize: 15,
                                                //     gravity: ToastGravity.BOTTOM,
                                                //     backgroundColor: Color(0XFF67949D),
                                                //     textColor: Colors.white,
                                                //   );
                                                //   //ScaffoldMessenger.of(context)
                                                //   //     .showSnackBar(SnackBar(
                                                //   //   content: AppNormalText(
                                                //   //     text: "Invalid username or password",
                                                //   //     size: 19,
                                                //   //     fw: FontWeight.bold,
                                                //   //   ),
                                                //   //   backgroundColor: Colors.blue,
                                                //   //   elevation: 5.0,
                                                //   //   dismissDirection: DismissDirection.endToStart,
                                                //   // ));
                                                // }
                                              });
                                            } else if (value
                                                    .data()!['userrole'] ==
                                                "manager") {
                                              FirebaseFirestore.instance
                                                  .collection('manager')
                                                  .doc(user.user!.uid)
                                                  .get()
                                                  .then(
                                                    (value) => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ManagerProfile(
                                                          uid: value
                                                              .data()!['uid'],
                                                          name: value
                                                              .data()!['name'],
                                                          mob: value.data()![
                                                              'mobile'],
                                                          emaill: value
                                                              .data()!['email'],
                                                          address:
                                                              value.data()![
                                                                  'address'],
                                                          experience:
                                                              value.data()![
                                                                  'experience'],
                                                          username:
                                                              value.data()![
                                                                  'username'],
                                                          password:
                                                              value.data()![
                                                                  'password'],
                                                          role: value.data()![
                                                              'userrole'],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                            }
                                          })).catchError((err){
                                     error=err;
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("Please check username and password",),
                                      //   backgroundColor: Colors.red,
                                      //   duration: const Duration(milliseconds: 1500),
                                      //   //width: 400.0, // Width of the SnackBar.
                                      //   // padding: const EdgeInsets.symmetric(
                                      //   //   horizontal: 8.0, // Inner padding for SnackBar content.
                                      //   // ),
                                      //   behavior: SnackBarBehavior.floating,
                                      //   shape: RoundedRectangleBorder(
                                      //     borderRadius: BorderRadius.circular(10.0),
                                      // ),
                                    ));


                                  });
                                }
                              }
                            },
                            child: ResponsiveButton(
                              col: Colors.blue,
                              text: "Login",
                              txtcolor: Colors.white,
                              width: 250,
                            ))
                        : GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: AppNormalText(
                                  text: "Please accept terms and conditions",
                                  size: 19,
                                  fw: FontWeight.bold,
                                ),
                                backgroundColor: Colors.blue,
                                elevation: 5.0,
                                dismissDirection: DismissDirection.endToStart,
                              ));
                            },
                            child: ResponsiveButton(
                              text: "Login",
                              txtcolor: Colors.white,
                              width: 250,
                            )),

                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      height: 8,
                    ),

                    GestureDetector(
                        onTap: () {},
                        child: AppNormalText(
                            text: "forgot?",
                            color: Colors.blue,
                            size: 25,
                            fw: FontWeight.w500)),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        child: AppNormalText(
                            text: "Create an account?",
                            color: Colors.blue,
                            size: 25,
                            fw: FontWeight.w500))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
