import 'dart:async';
import 'dart:math';

import 'package:bio_chemistry_vibhag/phone_size.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class StackCards extends StatefulWidget {
  var language;
  String icon;
  StackCards(this.language,this.icon);
  @override
  _StackCardsState createState() => _StackCardsState();
}

class _StackCardsState extends State<StackCards> {
  // List<dynamic> preventionsEng;
  // List<dynamic> preventionsHin;
  List<dynamic> someFactsEng;
  List<dynamic> someFactsHin;


  getData(){
    CollectionReference collectionReferenceEng = Firestore.instance.collection(widget.icon == 'horn'?'some_facts_english':'preventions_english');
    CollectionReference collectionReferenceHin = Firestore.instance.collection(widget.icon == 'horn'?'some_facts_hindi':'preventions_hindi');
    collectionReferenceEng.snapshots().listen((snapShot) {
      setState(() {
        someFactsEng =  snapShot.documents[0].data[widget.icon == 'horn'?'engSomefacts':'engPreventions'];
      });
    });
    collectionReferenceHin.snapshots().listen((snapShot) {

      setState(() {
        someFactsHin =  snapShot.documents[0].data[widget.icon == 'horn'?'hinSomeFacts':'hinPreventions'];
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getBack(){
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pop(true);
    });
  }

  var _counter = 0;
  @override
  Widget build(BuildContext context) {

    someFactsEng!=null?_counter == someFactsEng.length?getBack():null:null;
    double _size = PhoneSize().get(context);
    CardController controller;
    return someFactsEng != null && someFactsHin != null ? _counter == someFactsEng.length ? GestureDetector(child: Lottie.asset('assets/thankforsubmitting.json',repeat: false),onTap: () =>Navigator.of(context).pop(true)
      ,):
    Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.65,
          child: TinderSwapCard(
            animDuration:200,
            orientation:AmassOrientation.LEFT,
            totalNum: someFactsEng.length,
            stackNum: 3,
            swipeEdge: 4.0,
            maxWidth: MediaQuery.of(context).size.width * 0.85,
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            minWidth: MediaQuery.of(context).size.width * 0.84,
            minHeight: MediaQuery.of(context).size.height * 0.79,
            cardBuilder: (context, index) {
              // print('index ${index}');
              return Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.pink,
                    border: Border(

                      bottom: BorderSide( //                   <--- left side
                       color: Colors.black.withOpacity(0.05),
                       width: 4.0,
                      )
                    ),
                      // borderRadius: BorderRadius.all( Radius.circular(990))
                  ),
                  margin: EdgeInsets.all(16),
                  child:   SingleChildScrollView(
                      child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            (widget.language == 1 ?someFactsEng[_counter]['image'].toString()!='' : someFactsHin[_counter]['image'].toString() != '')?Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                  child: CircularProgressIndicator(
                                  ),
                                  padding: EdgeInsets.all(_size *12),
                                  height: MediaQuery.of(context).size.height * 0.35,
                                  width: MediaQuery.of(context).size.height * 0.35,
                                ),
                                GestureDetector(
                                  child: Container(
                                      height: MediaQuery.of(context).size.height * 0.35,
                                      child: Image.network(widget.language == 1 ?someFactsEng[_counter]['image'] : someFactsHin[_counter]['image'])
                                  ),
                                  onTap: () => launch(widget.language == 1 ?someFactsEng[_counter]['source'] : someFactsHin[_counter]['source'])
                                  ,
                                ),
                              ],
                            ):Container(),
                           Container(
                             padding: EdgeInsets.only(top: 8),
                                // color: Colors.greenAccent,
                                // height: MediaQuery.of(context).size.height * 0.24,
                                child: Text(widget.language == 1 ?someFactsEng[_counter]['text'].toString().replaceAll("|", "\n") : someFactsHin[_counter]['text'].toString().replaceAll("|", "\n"),
                                  style: TextStyle(fontFamily: 'Comic',fontSize: 2 *_size,color: Colors.black54),
                                ),
                              ),
                              // Container(
                              //   color: Colors.green,
                              //   height: 20,
                              // )
                          ],
                        )),
                ),
              );
            },
            cardController: controller = CardController(),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment
              if (align.x < 0) {
                //print("Card is LEFT swiping");
              } else if (align.x > 0) {
                //print("Card is RIGHT swiping");
              }
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              print(orientation.toString());
              if (orientation == CardSwipeOrientation.LEFT) {
                print("Card is LEFT swiping");
                setState(() {
                  _counter = _counter +1;
                });

              } else if (orientation == CardSwipeOrientation.RIGHT) {
                print("Card is RIGHT swiping");
                setState(() {
                  _counter = _counter +1;
                });
              }
            },
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.28,
          padding: EdgeInsets.symmetric(vertical: _size * 1.2),
          child:RaisedButton(
            elevation: 5,
            color: Colors.white,
            child: Text('Back',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: _size*3.2,
                  fontFamily:'Comic',
                  fontWeight: FontWeight.bold
              ),
            ),
            onPressed: () => Navigator.of(context).pop(true),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
        ),
      ],
    ):Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.white, // Red
          )
      ) ,
    );
  }
}
