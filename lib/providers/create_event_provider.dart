import 'package:flutter/material.dart';

class CreateEventProvider extends ChangeNotifier{
  List<String> eventCategories = [
    "birthday",
    "book_club",
    "sport",
    "eating",
    "exhibtion",
    "gaming",
    "meeting",
    "workshop",
    "holiday",
  ];

  int selectedCategory=0;


  changeCategory(int index){
    selectedCategory=index;
    notifyListeners();
  }
}