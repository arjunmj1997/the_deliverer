import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_deliverer/widgets/appbutton.dart';
class AddPaying extends StatefulWidget {
  const AddPaying({Key? key}) : super(key: key);

  @override
  _AddPayingState createState() => _AddPayingState();
}

class _AddPayingState extends State<AddPaying> {
  TextEditingController namecontroller2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ResponsiveButton(text: "Pay",width:120,),
             SizedBox(
               width: 8,
             ),
             SizedBox(
               width: 280,
               child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: namecontroller2,
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
             ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff094190),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,

      ),
    );
  }
}
