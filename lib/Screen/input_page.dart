import 'package:bmi_calculator_app/Screen/result_page.dart';
import 'package:bmi_calculator_app/component/bmi_calculator.dart';
import 'package:bmi_calculator_app/component/bottom_button.dart';
import 'package:bmi_calculator_app/component/constants.dart';
import 'package:bmi_calculator_app/component/icon_content.dart';
import 'package:bmi_calculator_app/component/reuseable_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
  none,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveContainerColor;
  Color femaleCardColor = kInactiveContainerColor;
   Gender selectedGender = Gender.none;
   int height = 150 ;
   int weight = 75 ;
   int age = 18;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Center(child:  Text('BMI Calculator')),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(child: ReuseableContainer(onPress:(){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },c : selectedGender == Gender.male ? kActiveContainerColor : kInactiveContainerColor,
                  widget:const IconContent(icon: FontAwesomeIcons.mars, text: "MALE") ,)),
                Expanded(child: ReuseableContainer(onPress:(){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },c :selectedGender == Gender.female ? kActiveContainerColor : kInactiveContainerColor,widget:const IconContent(icon: FontAwesomeIcons.venus, text: "FEMALE") ,)),
              ],
            ),
            Expanded(flex:3,child: ReuseableContainer(c :kActiveContainerColor,onPress: (){},widget: Column(
              mainAxisAlignment:  MainAxisAlignment.center,
              children:  [
                const Text("Height",style: kLabelStyle,),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children:  [
                    Text(height.toString(),style: kNumberStyle),
                    const SizedBox(width: 5.0,),
                    const Text("cm",style: kLabelStyle,),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor:  const Color(0xFF8D8E98),
                    thumbColor: const Color(0xFFEB1555),
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 20.0),
                    overlayColor: const Color(0x29EB1555),
                    overlayShape: const RoundSliderThumbShape(enabledThumbRadius: 30.0)

                  ),
                  child: Slider(value:height.toDouble(),min: 120.0,max: 250.0 , onChanged:(double newHeight){
                    setState(() {
                      height = newHeight.round();
                    });
                  }
                  ),
                )

              ],
            ),)),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(child: ReuseableContainer(c :kActiveContainerColor,onPress: (){},widget: 
                           Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children:  [
                               const Text("Weight",style: kLabelStyle,),
                               Row(
                                 crossAxisAlignment: CrossAxisAlignment.baseline,
                                 textBaseline: TextBaseline.alphabetic,
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children:  [
                                   Text(weight.toString(),style:kNumberStyle,),
                                   const SizedBox(width: 5.0,),
                                   const Text("kg",style:kLabelStyle,),
                                 ],
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   CircularIconButton(icon:FontAwesomeIcons.minus , onPress: (){
                                     setState(() {
                                       weight--;
                                     });
                                   }),
                                   const SizedBox(width: 10.0,),
                                   CircularIconButton(icon:FontAwesomeIcons.plus , onPress: (){
                                     setState(() {
                                       weight++;
                                     });
                                   }),
                                 ],
                               )

                             ],
                           )
    ),),
                  Expanded(child: ReuseableContainer(c :kActiveContainerColor,onPress: (){},widget:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text("Age",style: kLabelStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Text(age.toString(),style:kNumberStyle,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularIconButton(icon:FontAwesomeIcons.minus , onPress: (){
                            setState(() {
                              age--;
                            });
                          }),
                          const SizedBox(width: 10.0,),
                          CircularIconButton(icon:FontAwesomeIcons.plus , onPress: (){
                            setState(() {
                              age++;
                            });
                          }),
                        ],
                      )

                    ],
                  ))),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: BottomButton(onPress: (){
                BMICalculator c = BMICalculator(w: weight, h: height);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return   ResultPage(bmi: c.calculateBMI(), result:c.getResult(), description: c.getDescription(),);
                }));
              }, text: "Calculate"),
            ),
          ],
        ),
      ),
    );
  }
}



class CircularIconButton extends StatefulWidget {
     const CircularIconButton({Key? key,required this.icon,required this.onPress}) : super(key: key);
    final void Function() onPress;
    final IconData icon;
     @override
     _CircularIconButtonState createState() => _CircularIconButtonState();
   }

   class _CircularIconButtonState extends State<CircularIconButton> {
     @override
     Widget build(BuildContext context) {
       return RawMaterialButton(onPressed:widget.onPress ,
       child: Icon(widget.icon),
       shape: const CircleBorder(),
       fillColor: const Color(0xFf4c4f5e),
         constraints: const BoxConstraints(
           minHeight: 45.0,
           minWidth: 45.0,
         ),
       );
     }
   }
