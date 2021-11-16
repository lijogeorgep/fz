import 'package:fitness_zone/view/utilities/bmi.dart';
import 'package:fitness_zone/view/utilities/calorie_counter.dart';
import 'package:fitness_zone/view/utilities/fat_calculator.dart';
import 'package:fitness_zone/view/utilities/protien_calculator.dart';
import 'package:fitness_zone/view/utilities/water_intake_calculator.dart';
import 'package:flutter/material.dart';

class Utility extends StatefulWidget {
  const Utility({Key? key}) : super(key: key);

  @override
  _UtilityState createState() => _UtilityState();
}

class _UtilityState extends State<Utility> {
  List utilities = [
    'assets/images/bmi_calculator.png',
    'assets/images/calorie_counter.png',
    'assets/images/protien_calculator_removebg.png',
    'assets/images/fat_calculator.png',
    'assets/images/water_intake_calculator.png',
  ];
  List pages=[
   BmiCalculator(),
    CalorieCounter(),
    ProteinCalculator(),
    FatCalculator(),
    WaterIntakeCalculator()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2a2a35),
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Utilities'),
        ),
        //centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          itemCount: utilities.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[

                GestureDetector(
                  onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>pages[index])),
                  child: Container(

                   // color: Colors.grey.shade100,
                    height: 120,
                      width: 120,
                      child: Image.asset(utilities[index],fit: BoxFit.contain,)),
                ),
              //  Text(text[index]),
              ],

            );
          },
        ),
      ),
    );
  }
}
