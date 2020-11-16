
import 'dart:math';

import 'package:flutter/cupertino.dart';

class PhoneSize {
  double get(BuildContext context){
    return (sqrt((MediaQuery.of(context).size.width * MediaQuery.of(context).size.width) + (MediaQuery.of(context).size.height*MediaQuery.of(context).size.height)))*0.0104166667;
  }
}