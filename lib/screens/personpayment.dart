import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/widgets/appbutton.dart';
import 'package:the_deliverer/widgets/recatanglebutton.dart';
class PersonPay extends StatefulWidget {
  final String? payename;
  final String? payid;
  final String? receiveid;
  final String? receivename;
  final String? adid;

  const PersonPay({Key? key, this.payename, this.payid, this.receiveid, this.receivename, this.adid}) : super(key: key);

  @override
  _PersonPayState createState() => _PersonPayState();
}

class _PersonPayState extends State<PersonPay> {
  var paykey=GlobalKey<FormState>();
  TextEditingController namecontroller1= TextEditingController();
  TextEditingController accountnocontroller= TextEditingController();
  TextEditingController datecontroller= TextEditingController();
  TextEditingController amtcontroller= TextEditingController();
  late final String? recid;
  @override
  void initState() {
    recid=DateTime.now().toString();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff094190),
        actions: [
         // IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(
                height: 8,
              ),
              Form(
                key: paykey,
                child: Column(
                  children: [

                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value){
                        if(value!.length<2){
                          return "enter valid";
                        }
                      },
                      keyboardType: TextInputType.text,
                      controller: accountnocontroller,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "Enter accountnumber",
                          prefixIcon: Icon(Icons.account_circle_sharp),
                          hintStyle: TextStyle(color: Colors.black54),
                        suffixIcon:IconButton(onPressed:(){}, icon:Icon(Icons.search))
                      ),

                    ),
                    SizedBox(
                      height: 15,
                    ),

                    TextFormField(
                      validator: (value){
                        if(value!.length<2){
                          return "enter valid";
                        }
                      },
                      keyboardType: TextInputType.text,
                      controller: amtcontroller,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "Enter amount",
                          prefixIcon: Icon(Icons.account_circle_sharp),
                          hintStyle: TextStyle(color: Colors.black54),
                        suffixIcon:IconButton(onPressed:(){}, icon:Icon(Icons.search))
                      ),

                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value){
                        if(value!.length<2){
                          return "enter valid";
                        }
                      },
                      keyboardType: TextInputType.text,
                      controller: datecontroller,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "Enter date",
                          prefixIcon: Icon(Icons.account_circle_sharp),
                          hintStyle: TextStyle(color: Colors.black54),
                          suffixIcon:IconButton(onPressed:(){}, icon:Icon(Icons.search))
                      ),

                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),

            GestureDetector(

        onTap: (){
          if(paykey.currentState!.validate())
        FirebaseFirestore.instance
            .collection('receivingpay')
            .doc(recid)
            .set({
        'payid': recid,
        'payee': widget.payename,
        'payeeid': widget.payid,
        'recname': widget.receivename,
        'recieveid': widget.receiveid,
        'amount': amtcontroller.text,
        'date': datecontroller.text,
        'adid': datecontroller.text,
        'createdAt': DateTime.now(),
          'adid':widget.adid,

        'status': 1,
        } ).then((value) => print('saved'));
        },

                child: ResponsiveButton(text:"pay",)
    )
            ]
            ),
          ),
        ),

      ),
    );
  }
}
