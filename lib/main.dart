import 'dart:math';

import 'package:bio_chemistry_vibhag/knowMorePage/know_more_screen.dart';
import 'package:bio_chemistry_vibhag/phone_size.dart';
import 'package:bio_chemistry_vibhag/upper_homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Pb Awareness',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[600],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double _size = PhoneSize().get(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            Center(child: UpperHomePage()),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              child: Text('We Want to be \n LEAD Free',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 4.5 * _size,
                  color: Colors.white,
                  fontFamily:'Comic',
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height:MediaQuery.of(context).size.height * 0.02 ,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.7,
              child: RaisedButton(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                ),
                child:SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Know More How  ",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 2.8 * _size,
                        fontFamily:'Comic',
                        fontWeight: FontWeight.bold
                       ),
                      ),
                      Icon(Icons.arrow_forward,color: Theme.of(context).primaryColor)
                    ],
                  ),
                ) ,
                onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KnowMorePage()),
                  );
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3 - MediaQuery.of(context).padding.top,
              child: Image.asset('assets/images/hands.png'),
            )
          ],
        )
      ),
    );
  }
}
