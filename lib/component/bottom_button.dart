import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key,required this.onPress,required this.text}) : super(key: key);
  final void Function() onPress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        margin: const EdgeInsets.fromLTRB(0.0,5.0,0.0,0.0),
        child:  Center(child: Text(text),
      ),
    ));
  }
}
