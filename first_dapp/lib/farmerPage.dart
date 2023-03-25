import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Farmer extends StatefulWidget {
  const Farmer({super.key});

  @override
  State<Farmer> createState() => _FarmerState();
}

class _FarmerState extends State<Farmer> {

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
 

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Farmer"),
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
                  labelText: 'Product Name',
                  hintText: 'Enter Product Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: controller2,
                decoration: InputDecoration(
                  labelText: 'Product Code',
                  hintText: 'Enter product code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: controller3,
                decoration: InputDecoration(
                  labelText: 'Farm Information',
                  hintText: 'Farm Name + GLN',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: controller4,
                decoration: InputDecoration(
                  labelText: 'Haverst Date',
                  hintText: 'Enter Harvest Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: controller5,
                decoration: InputDecoration(
                  labelText: 'Ship Date From Farm',
                  hintText: 'Enter Ship Date',
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