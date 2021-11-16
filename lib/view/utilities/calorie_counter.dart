import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:numberpicker/numberpicker.dart';

class CalorieCounter extends StatefulWidget {
  const CalorieCounter({Key? key}) : super(key: key);

  @override
  _CalorieCounterState createState() => _CalorieCounterState();
}

class _CalorieCounterState extends State<CalorieCounter> {
  double _currentDoubleValue = 1.1;
  late int leftNumber;
  late int rightNumber;
  late double heightCm;
  late int age;
  late double calorieTotal;
  late String genderValue = "Gender.Male";
  late String result = "0.0";
  late String valueDropdownStorage="";
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Low';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2a2a35),
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Calorie Calculator'),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text(
                  "Choose your gender",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              getWidget(false, false),
              const Divider(),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "Choose your height (in feet)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              height(),

              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "Enter your weight (in kg)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _weightController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter body weight';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF2a2a35), width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    hintText: 'your body weight',
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "Enter your age",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _ageController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF2a2a35), width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    hintText: 'enter your age',
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey.shade400),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Choose your workout level",
                          style: TextStyle(
                              fontSize: 18.0, fontStyle: FontStyle.italic),
                        ),
                        VerticalDivider(),
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          //  style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            // color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>['Low', 'Moderate', 'High']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),

                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      if (genderValue == "Gender.Male") {
                        leftNumber = int.parse(
                            _currentDoubleValue.toString().substring(0, 1));
                        rightNumber = int.parse(
                            _currentDoubleValue.toString().substring(2, 3));
                        heightCm = ((leftNumber * 12) + rightNumber) * 2.54;
                        calorieTotal = 66.5 +
                            (13.8 * double.parse(_weightController.text)) +
                            ((5 * heightCm) /
                                (6.8 * double.parse(_weightController.text)));

                        if( dropdownValue=="Low"){
                          calorieTotal=calorieTotal*1.2;
                          result = calorieTotal.toStringAsFixed(1);
                        }
                        else if(dropdownValue=="Moderate"){
                          calorieTotal=calorieTotal*1.3;
                          result = calorieTotal.toStringAsFixed(1);
                        }
                        else if(dropdownValue=="High"){
                          calorieTotal=calorieTotal*1.4;
                          result = calorieTotal.toStringAsFixed(1);
                        }
                      } else if (genderValue == "Gender.Female") {
                        leftNumber = int.parse(
                            _currentDoubleValue.toString().substring(0, 1));
                        rightNumber = int.parse(
                            _currentDoubleValue.toString().substring(2, 3));
                        heightCm = ((leftNumber * 12) + rightNumber) * 2.54;
                        calorieTotal = 655.1 +
                            (9.6 * double.parse(_weightController.text)) +
                            ((1.9 * heightCm) /
                                (4.7 * double.parse(_weightController.text)));
                        if( dropdownValue=="Low"){
                          calorieTotal=calorieTotal*1.2;
                          result = calorieTotal.toStringAsFixed(1);
                        }
                        else if(dropdownValue=="Moderate"){
                          calorieTotal=calorieTotal*1.3;
                          result = calorieTotal.toStringAsFixed(1);
                        }
                        else if(dropdownValue=="High"){
                          calorieTotal=calorieTotal*1.4;
                          result = calorieTotal.toStringAsFixed(1);
                        }
                      }
                    } else {
                      print('Error');
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    color: const Color(0xFF2a2a35),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        'Calculate',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              StatefulBuilder(builder: (context, snapshot) {
                return Container(
                    color: Colors.grey.shade100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "Required calorie per day is : " + result,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ));
              }),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getWidget(bool showOtherGender, bool alignVertical) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: GenderPickerWithImage(
        showOtherGender: showOtherGender,
        verticalAlignedText: alignVertical,

        // to show what's selected on app opens, but by default it's Male
        selectedGender: Gender.Male,
        selectedGenderTextStyle: const TextStyle(
            color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        onChanged: (Gender? gender) {
          genderValue = gender.toString();
          print(genderValue);
        },
        //Alignment between icons
        equallyAligned: true,

        animationDuration: const Duration(milliseconds: 300),
        isCircular: true,
        // default : true,
        opacityOfGradient: 0.4,
        padding: const EdgeInsets.all(3),
        size: 50, //default : 40
      ),
    );
  }

  Widget height() {
    return Container(
      color: Colors.grey.shade100,
      child: DecimalNumberPicker(
        value: _currentDoubleValue,
        minValue: 0,
        maxValue: 9,
        decimalPlaces: 1,
        onChanged: (value) => setState(() => _currentDoubleValue = value),
      ),
    );
  }
}
