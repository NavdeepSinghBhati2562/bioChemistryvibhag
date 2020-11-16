import 'package:bio_chemistry_vibhag/phone_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Developers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _size = PhoneSize().get(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Designed and Developed by',style: TextStyle(fontSize: 3* _size,fontFamily: 'Comic',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.15),
                child: Image.asset('assets/images/plogo.png'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              Text('New World of \n Possibilities',style: TextStyle(fontSize: 4* _size,fontFamily: 'Comic',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
              RaisedButton(
                elevation: 5,
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text('Visit Our Website',style: TextStyle(fontFamily: 'Comic',fontSize: _size * 2.5,color: Colors.white),),
                onPressed:(){
                  launch('https://perfectpixel.in');
                },
              ),
              RaisedButton(
                elevation: 5,
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text('Contact Us',style: TextStyle(fontFamily: 'Comic',fontSize: _size * 2.5,color: Colors.white),),
                onPressed:(){
                  launch('https://perfectpixel.in/contact/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
