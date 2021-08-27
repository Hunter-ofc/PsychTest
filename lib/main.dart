import 'package:flutter/material.dart';
import 'package:fluttertestproject/login.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Container(),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width/2,
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xff3A44F9))
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text("Login", style: TextStyle(color: Color(0xff3A44F9))),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
                  },
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
      pages: [
        PageViewModel(
          title: "Learn design disciplines on the go",
          body: "Learn design skills with easy to understand, bite sized content.",
          image: Container(
            height: double.infinity,
            width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xff3A44F9),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)
                  )
              )
          ),
        ),
        PageViewModel(
          title: "Create amazing designs",
          body: "Apply what you learn and design apps, websites and much more.",
          image: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xff3A44F9),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)
                  )
              )
          ),
        ),
        PageViewModel(
          title: "Build best apps and websites",
          body: "Apply what you learn and design apps, websites and much more.",
          image: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xff3A44F9),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)
                  )
              )
          ),
        ),
      ],
      onDone: () {},
      showSkipButton: false,
      skipFlex: 0,
      nextFlex: 0,
      next: Container(),
      done: Container(),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xff3A44F9),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}