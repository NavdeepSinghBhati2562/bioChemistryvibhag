import 'dart:async';

import 'package:bio_chemistry_vibhag/phone_size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ThankYouScreen extends StatefulWidget {
  double score;
  ThankYouScreen(this.score);

  @override
  _ThankYouScreenState createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pop(true);
    });
  }
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => Navigator.of(context).pop(true),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/done.json',repeat: false),
              SizedBox(height:MediaQuery.of(context).size.height* 0.1 ,),
              Text('Thank You For Submitting',style:TextStyle(fontSize: PhoneSize().get(context)* 2.5,fontFamily: 'Comic'),),
              SizedBox(height:MediaQuery.of(context).size.height* 0.03 ,),
              widget.score >= 0 && widget.score<= 50 ?
                Text('You got',style:TextStyle(fontSize: PhoneSize().get(context)* 3,fontFamily: 'Comic'),)
              :Text('Congratulation You got',style:TextStyle(fontSize: PhoneSize().get(context)* 2.5,fontFamily: 'Comic'),),
              SizedBox(height:MediaQuery.of(context).size.height* 0.01 ,),
            Text((widget.score.toInt()).toString()+'%',style:TextStyle(fontSize: PhoneSize().get(context)* 4,fontFamily: 'Comic',color: Theme.of(context).primaryColor),)
            ],
          ),
        ),
      ),
    );
  }
}
