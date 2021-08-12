import 'package:flutter/cupertino.dart';

class MainModel extends ChangeNotifier {
  String sigmaText = 'sigmaだよ';

  void changeSigmaText(){
    sigmaText = 'sigmaさんかっこいい';
    notifyListeners();
  }
}