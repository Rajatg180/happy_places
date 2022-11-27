import 'package:flutter/foundation.dart';
import '../Models/places.dart';
import 'dart:io';
class GreatPlaces with ChangeNotifier{
  List<Places> _iteams=[];


  //returning the _iteams copy we are not going to change iteams list from outside 
  List<Places> get iteams{
    //returning copy
    return [..._iteams];
  }

  void addPlace(String pickedTitle,File pickedImage){
    final newPlace=Places(id: DateTime.now().toString(), title: pickedTitle, loaction: null, image: pickedImage);
    _iteams.add(newPlace);
    notifyListeners();

  }
  
}