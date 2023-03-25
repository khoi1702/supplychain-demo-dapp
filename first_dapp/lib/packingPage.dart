import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';
class Packing extends StatefulWidget {
  const Packing({super.key});

  @override
  State<Packing> createState() => _PackingState();
}

class _PackingState extends State<Packing> {

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Packing"),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: controller1,
                decoration: InputDecoration(
                  labelText: 'product Code',
                  hintText: 'Enter product code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: controller2,
                decoration: InputDecoration(
                  labelText: 'Packing Information',
                  hintText: 'Enter Name + GLN',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: controller3,
                decoration: InputDecoration(
                  labelText: 'Expire Date',
                  hintText: 'Enter Expire Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: controller4,
                decoration: InputDecoration(
                  labelText: 'Manufacture Date',
                  hintText: 'Enter Manufacture Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: controller5,
                decoration: InputDecoration(
                  labelText: 'Shipping Date From Packing ',
                  hintText: 'Enter shipping Date ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
              
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () async{
                
              }, child: Text('Add Product')),
              
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
  
