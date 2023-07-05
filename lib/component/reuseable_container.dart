import 'package:flutter/cupertino.dart';

class ReuseableContainer extends StatelessWidget {
  ReuseableContainer({Key? key, required this.onPress, required this.c,required this.widget}) : super(key: key);
  final Color c;
  final Widget widget;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: widget,
        margin: const EdgeInsets.all(5.0),
        width: double.infinity,
        height: 190.0,
        decoration: BoxDecoration(
          color: c,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}