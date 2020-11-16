
import 'package:bio_chemistry_vibhag/knowMorePage/text_image_button.dart';
import 'package:bio_chemistry_vibhag/phone_size.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';

class KnowMorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _size = PhoneSize().get(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Hero(
                  tag: 'upper',
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: Arc(
                      arcType: ArcType.CONVEX,
                      edge: Edge.BOTTOM,
                      height: 70.0,
                      clipShadows: [ClipShadow(color: Colors.black)],
                      child: new Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: FittedBox(
                    child: Text('Know How to be LEAD Free !',
                        style: TextStyle(color: Colors.white,fontFamily: 'Comic',fontSize: 3.3 * _size)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.15),
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: FittedBox(
                    child: Text('जानिए कैसे रहें LEAD फ्री!',
                        style: TextStyle(color: Colors.white,fontFamily: 'Comic',fontSize: 3.3 * _size)),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                TextImageButton('horn','Some Facts \nकुछ तथ्य '),
                TextImageButton('shild','Prevention \nरोक थाम'),
                TextImageButton('assesment','Assessment \nमूल्यांकन '),
                TextImageButton('video','Videos     '),
                TextImageButton('perfectpixel','Developers')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
