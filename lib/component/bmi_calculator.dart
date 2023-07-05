

import 'dart:math';

class BMICalculator {
  BMICalculator({required this.w,required this.h});
  int w;
  int h;
  double _bmi=0.0;
  String calculateBMI(){
    _bmi = w/pow(h/100,2);
    print(_bmi);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>=25){
      return "Overweight";
    }
    else if(_bmi>18.5){
      return "Normal";
    }
    else {
      return "Underweight";
    }
  }

  String getDescription(){
    if(_bmi>=25){
      return "You have higher than normal body weight. Try to exercise more !";
    }
    else if(_bmi>18.5){
      return "You have a normal body weight. Good job !";
    }
    else {
      return "You have lower than normal. You can eat a bit more !";
    }
  }
}