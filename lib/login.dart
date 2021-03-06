import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertestproject/home.dart';

import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  login() async {

    var dio = Dio();

    Map<String, dynamic> body = {
      "email":emailController.text,
      "password": passwordController.text
    };

    FormData formData = new FormData.fromMap(body);

    var response = await dio.post('http://dev-api.commicado.io/auth/login', data: formData);

    print(response.data["success"]);
    print(response.data["data"]);
    print(response.data["data"]["name"]);
    print(response.data["data"]["status"].runtimeType);

    String name = response.data["data"]["name"];
    int status = response.data["data"]["status"];
    String email = emailController.text;

    if(response.data["success"] == true) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(email, name, status)));
    }

  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/2,
                height: 60,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff3A44F9),
                      border: Border(
                        top: BorderSide(color: Color(0xff3A44F9)),
                        right: BorderSide(color: Color(0xff3A44F9)),
                        left: BorderSide(color: Color(0xff3A44F9)),
                        bottom: BorderSide(color: Colors.white, width: 4.0),
                      )
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff3A44F9),
                    ),
                    child: Text("Login", style: TextStyle(color: Colors.white)),
                    onPressed: (){},
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/2,
                height: 60,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff3A44F9),
                      border: Border.all(color: Color(0xff3A44F9))
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff3A44F9),
                    ),
                    child: Text("SignUp", style: TextStyle(color: Colors.white)),
                    onPressed: (){},
                  ),
                ),
              ),
            ],
          ),
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
                controller: emailController,
                // obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Email',
                    prefixIcon: Icon(Icons.attach_email)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    prefixIcon: Icon(Icons.lock_rounded)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("Forgot Password?", style: TextStyle(color: Colors.blueAccent),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: SizedBox(
                width: 250,
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff3A44F9),
                      border: Border.all(color: Color(0xff3A44F9))
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff3A44F9),
                    ),
                    child: Text("Let's start Learning", style: TextStyle(color: Colors.white)),
                    onPressed: (){
                      login();
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text("or login with", style: TextStyle(color: Colors.grey),),
            )

          ],
        ),
        bottomNavigationBar: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width/2,
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xff3A44F9)),
                      right: BorderSide(color: Color(0xff3A44F9)),
                      left: BorderSide(color: Color(0xff3A44F9)),
                      bottom: BorderSide(color: Color(0xff3A44F9)),
                    )
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text("Facebook", style: TextStyle(color: Color(0xff3A44F9))),
                  onPressed: (){},
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width/2,
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xff3A44F9)),
                      right: BorderSide(color: Color(0xff3A44F9)),
                      // left: BorderSide(color: Color(0xff3A44F9)),
                      bottom: BorderSide(color: Color(0xff3A44F9)),
                    )
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text("Google", style: TextStyle(color: Color(0xff3A44F9))),
                  onPressed: (){},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
