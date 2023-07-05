import 'package:bmi_calculator_app/component/bottom_button.dart';
import 'package:bmi_calculator_app/component/constants.dart';
import 'package:bmi_calculator_app/component/reuseable_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'input_page.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key,required this.bmi,required this.result,required this.description}) : super(key: key);
  final String bmi ;
  final String result;
  final String description;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Theme.of(context).primaryColor,
       title: const Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(flex:2,child: Center(child: Text("Result",style: kNumberStyle,))),
          Expanded( flex: 8,
            child: ReuseableContainer(onPress: (){}, c: kActiveContainerColor, widget: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                Text(widget.result,style: kTitleTextStyle),
                Text(widget.bmi,style: kBMITextStyle),
                Text(widget.description,textAlign: TextAlign.center,style: kDesTextStyle)
              ],
            )),
          ),
          Expanded(
            flex: 1,
            child:BottomButton(onPress: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const InputPage()));
            }, text: "Re-calculate")
          )
        ],
      ),
    );
  }
}
