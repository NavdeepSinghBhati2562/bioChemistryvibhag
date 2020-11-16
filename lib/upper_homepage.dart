import 'package:bio_chemistry_vibhag/phone_size.dart';
import 'package:flutter/material.dart';

class UpperHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double _size = PhoneSize().get(context);
    return Hero(
      tag: 'upper',
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(MediaQuery.of(context).size.width * 0.5),bottomLeft: Radius.circular(MediaQuery.of(context).size.width * 0.5)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0.0,1.0), //(x,y)
                  blurRadius: 6.0,
                  color: Colors.blue[800]
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02 ,),
              Container(
                // color: Colors.indigo,
                height: MediaQuery.of(context).size.height * 0.18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                        child: Image.asset('assets/images/nrclp.png',fit: BoxFit.contain,)
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.4
                        ,
                        child: Image.asset('assets/images/aiims.png',fit: BoxFit.contain,)
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: Image.asset('assets/images/inslar.png',fit: BoxFit.contain,)
                    ),
                  ],
                ),
              ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width * 0.7,

                child: FittedBox(
                  child: Text('Joint Initiative by\nDepartment of Biochemistry,\nAll India Institute of Medical Sciences,\nJodhpur,\nNRCLPI And InSLAR\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 2.0 * _size,
                    fontFamily: 'Comic',
                   ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
