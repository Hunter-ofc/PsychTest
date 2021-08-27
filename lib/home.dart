import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import 'login.dart';

class Home extends StatefulWidget {
  String email;
  String name;
  int status;

  Home(this.email, this.name, this.status);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final statusController = TextEditingController();
  String displayNameLetter = '';

  @override
  void initState() {
    super.initState();

    emailController.text = widget.email;
    displayNameLetter = widget.name[0];
    nameController.text = widget.name;
    statusController.text = widget.status.toString();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
              child: Icon(Icons.arrow_back_ios_outlined)
          ),
          backgroundColor: Color(0xff3A44F9),
          title: Text("Home"),
        ),
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/3,
                  decoration: BoxDecoration(
                      color: Color(0xff3A44F9),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)
                      )
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    color: Colors.white
                  ),
                  child: Center(
                    child: Text(displayNameLetter.toUpperCase(), style: TextStyle(fontSize: 25.0),),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter Name',
                    prefixIcon: Icon(Icons.account_circle_rounded, color: Colors.black,)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
              child: TextField(
                controller: statusController,
                decoration: InputDecoration(
                    labelText: 'Status',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter Status',
                    prefixIcon: Icon(Icons.account_circle_rounded, color: Colors.black,)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
              child: TextField(
                style: TextStyle(color: Colors.grey),
                controller: emailController,
                enabled: false,
                decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.attach_email, color: Colors.grey,)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
