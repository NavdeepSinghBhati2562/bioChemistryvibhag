
import 'package:bio_chemistry_vibhag/knowMorePage/formPage/user_form_screen.dart';
import 'package:bio_chemistry_vibhag/knowMorePage/stack_cards.dart';
import 'package:bio_chemistry_vibhag/phone_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardScreen extends StatefulWidget {
  final String icon;
  final String text;
  CardScreen(this.icon,this.text);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {

  List<Map<String,String>> someFactsData = const [

  ];

  int _value = 1;
  @override
  Widget build(BuildContext context) {
    double _size = PhoneSize().get(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height ,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25 - MediaQuery.of(context).padding.top,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                        tag: widget.icon,
                        child: ClipRect(
                          child: Container(
                            // color: Colors.purple,
                            // width: MediaQuery.of(context).size.width * 0.33,
                            // height:MediaQuery.of(context).size.width * 0.33 ,
                            // padding: EdgeInsets.all(4),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              widthFactor: 0.75,
                              heightFactor: 0.75,
                              child: Container(
                                // decoration: BoxDecoration(
                                //   color: Colors.white,
                                  // borderRadius: BorderRadiusDirectional.all(Radius.circular(100))
                                // ),
                                child:CircleAvatar(
                                  backgroundColor: Colors.blue[200],
                                  radius:_size *10,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: _size * 5,left: _size * 5,right: _size *2 ,bottom: _size *2),
                                    child: SvgPicture.asset(
                                      'assets/images/'+widget.icon+'.svg',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(width: MediaQuery.of(context).size.width * 0.07,),
                      Container(
                        // color: Colors.pink,
                        width: MediaQuery.of(context).size.width*0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
                            Container(
                              // color: Colors.yellowAccent,
                              height: MediaQuery.of(context).size.height * 0.11,
                              child: FittedBox(
                                child: Text(widget.text,style: TextStyle(fontFamily: 'Comic',color: Colors.white),
                                 ),
                              )),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
                            Container(
                              // margin: EdgeInsets.only(top: 5),
                              height:1.0,
                              width:MediaQuery.of(context).size.width * 0.6,
                              color:Colors.white,),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                            Container(
                                height: MediaQuery.of(context).size.height * 0.04,
                              child: Row(
                                children: [
                                  Text('English',style: TextStyle(color: Colors.white,fontFamily: 'Comic',fontSize: 2.5 * _size),),
                                  Radio(
                                    activeColor: Colors.white,
                                    value: 1,
                                    groupValue: _value,
                                    onChanged: (val){
                                      setState(() {
                                        _value = val;
                                      });
                                    },
                                  ),
                                  Text('हिंदी',style: TextStyle(color: Colors.white,fontFamily: 'Comic',fontSize: 2.5 * _size)),
                                  Radio(
                                    activeColor: Colors.white,
                                    value: 2,
                                    groupValue: _value,
                                    onChanged: (val){
                                      setState(() {
                                        _value = val;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )
                           ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: widget.icon == 'assesment' ? EdgeInsets.all(0):EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
                    height: MediaQuery.of(context).size.height * 0.75,
                  child: widget.icon == 'assesment'?UserFormScreen(_value):StackCards(_value,widget.icon),
                ),
                // widget.icon == 'assesment'?Container():

              ],
            ),
          ),
        ),
      ),
    );
  }
}
