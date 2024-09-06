import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {  // ChangeNotifier is a class that provides change notification to its listeners.
    final String _gender = '';
    final int _age = 0;
    final String _height = '';
    final String _weight = '';
    final String _activityLevel = '';
    final String _goal = '';


  String get gender => _gender;
  int get age => _age;
  String get height => _height;
  String get weight => _weight;
  String get activityLevel => _activityLevel;

  String get goal => _goal;

    void setGender(String gender){
      gender = gender;
    }
    void setAge(int age){
      age = age;
    }

    void setHeight(String height){
      height = height;
    }

    void setWeight(String weight){
      weight = weight;
    }

    void setActivityLevel(String activityLevel){
      activityLevel = activityLevel;
    }
}