import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:numberpicker/numberpicker.dart';

class FatCalculator extends StatefulWidget {
  const FatCalculator({Key? key}) : super(key: key);

  @override
  _FatCalculatorState createState() => _FatCalculatorState();
}

class _FatCalculatorState extends State<FatCalculator> {
  double _currentDoubleValue = 1.1;
  late int leftNumber;
  late int rightNumber;
  late double heightCm;
  late int age;
  late double bmi;
  late double bfp;
  late String genderValue = "Gender.Male";
  late String result = "0.0";
  late String valueDropdownStorage = "";
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2a2a35),
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Fat Calculator'),
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
                        bmi =
                            ((double.parse(_weightController.text) / heightCm) /
                                    heightCm) *
                                10000;
                        bfp = 1.20 * bmi +
                            (0.23 * double.parse(_ageController.text)) -
                            16.2;
                        result = bfp.toStringAsFixed(1);
                      } else if (genderValue == "Gender.Female") {
                        leftNumber = int.parse(
                            _currentDoubleValue.toString().substring(0, 1));
                        rightNumber = int.parse(
                            _currentDoubleValue.toString().substring(2, 3));
                        heightCm = ((leftNumber * 12) + rightNumber) * 2.54;
                        bmi =
                            ((double.parse(_weightController.text) / heightCm) /
                                    heightCm) *
                                10000;
                        bfp = 1.20 * bmi +
                            (0.23 * double.parse(_ageController.text)) -
                            5.4;
                        result = bfp.toStringAsFixed(1);
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
                          child: Row(
                           mainAxisAlignment:MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Your body fat percentage is : ",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                result+" %",
                                style: const TextStyle(fontSize: 20,color: Colors.purple),
                              ),

                            ],
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  // textDirection: TextDirection.rtl,
                  // defaultVerticalAlignment: TableCellVerticalAlignment.c,
                  border:
                      TableBorder.all(width: 2.0, color: Colors.grey.shade300),
                  children: [
                    TableRow(children: [
                      Container(
                        color: const Color(0xFF2a2a35),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            "Description",
                            textScaleFactor: 1.5,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ),
                      Container(
                        color: const Color(0xFF2a2a35),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            "Women",
                            textScaleFactor: 1.5,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ),
                      Container(
                        color: const Color(0xFF2a2a35),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            "Men",
                            textScaleFactor: 1.5,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ),
                    ]),
                    const TableRow(children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                            child: Text("Essential", textScaleFactor: 1.5)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Center(child: Text("10-13%", textScaleFactor: 1.5)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Center(child: Text("2-5%", textScaleFactor: 1.5)),
                      ),
                    ]),
                    const TableRow(children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                            child: Text("Athletes", textScaleFactor: 1.5)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Center(child: Text("14-20%", textScaleFactor: 1.5)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Center(child: Text("6-13%", textScaleFactor: 1.5)),
                      ),
                    ]),
                    const TableRow(children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                            child: Text("Fitness", textScaleFactor: 1.5)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Center(child: Text("21-24%", textScaleFactor: 1.5)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Center(child: Text("14-17%", textScaleFactor: 1.5)),
                      ),
                    ]),
                    const TableRow(children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                            child: Text("Average", textScaleFactor: 1.5)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Center(child: Text("25-31%", textScaleFactor: 1.5)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Center(child: Text("18-24%", textScaleFactor: 1.5)),
                      ),
                    ]),
                    const TableRow(children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Center(child: Text("Obese", textScaleFactor: 1.5)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Center(child: Text("32+%", textScaleFactor: 1.5)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Center(child: Text("25+%", textScaleFactor: 1.5)),
                      ),
                    ]),
                  ],
                ),
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
