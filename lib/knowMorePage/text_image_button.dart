import 'package:bio_chemistry_vibhag/knowMorePage/card_screen.dart';
import 'package:bio_chemistry_vibhag/knowMorePage/developers.dart';
import 'package:bio_chemistry_vibhag/phone_size.dart';
import 'package:bio_chemistry_vibhag/videoPlayer//screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextImageButton extends StatefulWidget {
  final String icon;
  final String text;
  TextImageButton(this.icon,this.text);

  @override
  _TextImageButtonState createState() => _TextImageButtonState();
}

class _TextImageButtonState extends State<TextImageButton> {
  bool shadow = false;
  @override
  Widget build(BuildContext context) {
    double _size = PhoneSize().get(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
        vertical: MediaQuery.of(context).size.height * 0.02
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.all(Radius.circular(25)),
        boxShadow: <BoxShadow>[
            BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(3, 3),
          ),
          if(shadow == false)
            BoxShadow(
            color: Colors.white.withOpacity(0.2),
            blurRadius: 2,
            offset: Offset(-3, -3),
          )
        ],
      ),
      child: FlatButton(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)
        ),
        onHighlightChanged: (val){
          setState(() {
            shadow = val;
          });
        },
        onPressed: (){
          if(widget.icon == 'horn')
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              CardScreen(widget.icon,widget.text)));
          if(widget.icon == 'shild')
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                CardScreen(widget.icon,widget.text)));
          if(widget.icon == 'assesment')
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                CardScreen(widget.icon,widget.text)));
          if(widget.icon == 'video')
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                HomeScreen()));
          if(widget.icon == 'perfectpixel')
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                Developers()));
        },
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: widget.icon,
              child: Container(
                  child: CircleAvatar(
                    radius: 3.8 *_size,
                      backgroundColor: Colors.blue[200],
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: widget.icon == 'perfectpixel'?Image.asset('assets/images/perfectpixel.png'):SvgPicture.asset('assets/images/'+widget.icon+'.svg'),
                      ))
              ),
            ),
            Text(widget.text,style: TextStyle(fontSize: 2.8*_size,fontFamily: 'Comic',color: Colors.white),),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              alignment: Alignment.bottomRight,
                child: SvgPicture.asset('assets/images/arrow_forward.svg',color: Colors.yellowAccent,width: _size * 3))
          ],
        )
      ),
    );
  }
}
