import 'package:bio_chemistry_vibhag/knowMorePage/formPage/thank_you_screen.dart';
import 'package:bio_chemistry_vibhag/phone_size.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserFormScreen extends StatefulWidget {
  var language;
  UserFormScreen(this.language);
  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  int selectedRadio;
  int selectedRadioTile;
  int questionIndex = 0;
  bool submitFlag = false;
  bool mustFillFlag = false;
  List<Map<String,Object>> afterFeedBack = [];
  List<dynamic> questionsEng;
  List<dynamic> questionsHin;
  int score = 0;
  int total = 0;


  previousButton(){
    setState(() {
      if(questionIndex>0){
        questionIndex = questionIndex - 1;
        submitFlag=false;
      }
    });
  }
  nextButton(){
    setState(() {
      if(questionIndex<questionsEng.length-1){
        questionIndex = questionIndex +1;
        selectedRadioTile = null;
        mustFillFlag = false;
      }
      if(questionIndex==questionsEng.length-1){
        submitFlag = true;

      }
    });
  }
  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
      mustFillFlag = true;
    });
  }

  addResponse() async{
    afterFeedBack.removeRange(questionsEng.length,afterFeedBack.length);
    print(afterFeedBack);
    await Firestore.instance.collection('data').document().setData(
        {
          'response':afterFeedBack
        }
    );
  }
  fetchData(){
    CollectionReference collectionReferenceEng = Firestore.instance.collection('english_questions');
    CollectionReference collectionReferenceHin = Firestore.instance.collection('hindi_questions');
    collectionReferenceEng.snapshots().listen((snapShot) {
      setState(() {
        questionsEng =  snapShot.documents[0].data['questionsEng'];
      });

    });
    collectionReferenceHin.snapshots().listen((snapShot) {

      setState(() {
        questionsHin =  snapShot.documents[0].data['questionsHin'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    fetchData();
    // selectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    // print(afterFeedBack);
    List nAnswer = questionsEng != null && questionsHin != null?(widget.language == 1 ? questionsEng[questionIndex]['answers'] : questionsHin[questionIndex]['answers']) : null;
    String nQuestion = questionsEng != null && questionsHin != null?(widget.language == 1 && questionsEng != null? questionsEng[questionIndex]['questionText'] : questionsHin[questionIndex]['questionText']) : null;
    String nType = questionsEng != null && questionsHin != null?(widget.language == 1 && questionsEng != null? questionsEng[questionIndex]['type'] : questionsHin[questionIndex]['type']) : null;
    int nRightAnswer = questionsEng != null && questionsHin != null?(widget.language == 1 && questionsEng != null? questionsEng[questionIndex]['rightAnswer'] : questionsHin[questionIndex]['rightAnswer']) : null;
    double _size = PhoneSize().get(context);
    return Container(
      child: Scaffold(
        body:  nAnswer == null || nQuestion == null || nType == null ? Container(
          color: Theme.of(context).primaryColor,
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ):Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                // color: Colors.pink,
                height: MediaQuery.of(context).size.height * 0.48,
                margin: EdgeInsets.all(10),
                child: Card(
                  elevation: 5,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 20,right: 20,top: 20 ,bottom: 16),
                          child: Text(nQuestion,style: TextStyle(fontSize: _size * 2.6,fontFamily: 'Comic')
                            ,)
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.24,
                        child: nType == 'input'?Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextFormField(
                            onFieldSubmitted: (val){
                              afterFeedBack.insert(questionIndex ,{'answer':val.toString()});
                              mustFillFlag = true;
                            },
                          ),
                        ):ListView.builder(itemBuilder: (context, index) {

                          return RadioListTile(
                            value: index+1,
                            groupValue: selectedRadioTile,
                            title: Text(nAnswer[index]['text'],style: TextStyle(fontFamily: 'Comic',fontSize: _size * 2)),
                            onChanged: (val) {
                              setSelectedRadioTile(val);
                              afterFeedBack.insert(questionIndex ,{'answer':val.toString()
                              });
                              total = total +1;
                              if(val == nRightAnswer){
                                score = score + 1;
                              }
                            },
                            selected: false,
                          );
                        } ,
                          itemCount:nAnswer.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                        ),
                      )
                    ],
                  )

                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.skip_previous,size: 35,),
                      onPressed:questionIndex == 0 ? (){} : previousButton,
                      color: Colors.white,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width *0.7,
                      child: LinearProgressIndicator(
                        value:(questionIndex+1)/questionsEng.length,
                        backgroundColor: Colors.white70,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreenAccent),
                      ),
                    ),
                    IconButton(
                        onPressed:mustFillFlag == true ? nextButton: null,
                        icon: Icon(Icons.skip_next,size: 35,
                        color: Colors.white,
                        )),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      elevation: 5,
                      color: Colors.white,
                      child: Text('Previous',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: _size * 2.2,
                            fontFamily:'Comic',
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: questionIndex == 0 ? null : previousButton,
                    ),
                    RaisedButton(
                      elevation: 5,
                      color: Colors.white,
                      child: Text('SUBMIT',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: _size * 2.2,
                            fontFamily:'Comic',
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: submitFlag == true && mustFillFlag == true ? (){
                        setState(() {
                        });
                        addResponse();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ThankYouScreen((score/total)*100)));
                      }:null,
                    ),
                    RaisedButton(
                      child: Text('Next',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: _size * 2.2,
                            fontFamily:'Comic',
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: mustFillFlag == true && questionIndex != questionsEng.length -1 ? nextButton: null,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
