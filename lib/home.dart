import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3A44F9),
          title: Text("Home"),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/3,
              // color: Color(0xff3A44F9),
              decoration: BoxDecoration(
                  color: Color(0xff3A44F9),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter Na',
                    prefixIcon: Icon(Icons.account_circle_rounded)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Status',
                    hintText: 'Enter Status',
                    prefixIcon: Icon(Icons.account_circle_rounded)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Email',
                    // hintText: 'Enter Password',
                    prefixIcon: Icon(Icons.attach_email)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
