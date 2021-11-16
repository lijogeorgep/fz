import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:numberpicker/numberpicker.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  double _currentDoubleValue = 1.1;
  late int leftNumber;
  late int rightNumber;
  late double heightCm;
  late double bmi;
  late String opinion = "";
  late String result = "0.0";
  final TextEditingController _weightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2a2a35),
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('BMI Calculator'),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "Choose your gender",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              getWidget(false, false),
              const Divider(),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "Choose your height (in feet)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              height(),
              const Divider(),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "Enter your weight (in kg)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      leftNumber = int.parse(
                          _currentDoubleValue.toString().substring(0, 1));
                      rightNumber = int.parse(
                          _currentDoubleValue.toString().substring(2, 3));
                      heightCm = ((leftNumber * 12) + rightNumber) * 2.54;
                      bmi = ((double.parse(_weightController.text) / heightCm) /
                              heightCm) *
                          10000;
                      result = bmi.toStringAsFixed(1);
                      if (bmi >= 30.0) {
                        opinion = 'Obesity';
                      } else if (bmi >= 25.0 && bmi <= 29.9) {
                        opinion = 'Over Weight';
                      } else if (bmi >= 18.5 && bmi <= 24.9) {
                        opinion = 'Normal Weight';
                      } else {
                        opinion = 'Under Weight';
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
                        Text(
                          "Your BMI is : " + result,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          opinion,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.purple),
                        ),
                      ],
                    ));
              }),
              const SizedBox(
                height: 10,
              ),
              const Text('BMI Categories:'),
              const Text('Underweight = <18.5'),
              const Text('Normal weight = 18.5–24.9'),
              const Text('Overweight = 25–29.9'),
              const Text('Obesity = BMI of 30 or greater'),
            ],
          ),
        ),
      ),
    );
  }

  Widget getWidget(bool showOtherGender, bool alignVertical) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
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
          //:TODO
          print(gender);
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
