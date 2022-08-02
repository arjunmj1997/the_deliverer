import 'package:flutter/material.dart';
class PersonPay extends StatefulWidget {
  const PersonPay({Key? key}) : super(key: key);

  @override
  _PersonPayState createState() => _PersonPayState();
}

class _PersonPayState extends State<PersonPay> {
  TextEditingController namecontroller1= TextEditingController();
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
        child: Column(
        children:[
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: namecontroller1,
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
                  hintText: "Enter name",
                  prefixIcon: Icon(Icons.account_circle_sharp),
                  hintStyle: TextStyle(color: Colors.black54),
                suffixIcon:IconButton(onPressed:(){}, icon:Icon(Icons.search))
              ),

            ),
          ),
        ]
        ),

      ),
    );
  }
}
