import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:numberpicker/numberpicker.dart';

class WaterIntakeCalculator extends StatefulWidget {
  const WaterIntakeCalculator({Key? key}) : super(key: key);

  @override
  _WaterIntakeCalculatorState createState() => _WaterIntakeCalculatorState();
}

class _WaterIntakeCalculatorState extends State<WaterIntakeCalculator> {
  double _currentDoubleValue = 1.1;
  String dropdownValue = 'Low';
  final TextEditingController _weightController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  double wit = 0.0;
  late String result = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2a2a35),
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Water Intake Calculator'),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
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
                            "Choose your activity level",
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        wit = ((double.parse(_weightController.text)) * 2.20) *
                            (2 / 3);
                        if (dropdownValue == "Low") {
                          result = (wit / 8).round().toString();
                        } else if (dropdownValue == "Moderate") {
                          result = ((wit + 12) / 8).round().toString();
                        } else if (dropdownValue == "High") {
                          result = ((wit + 22) / 8).round().toString();
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
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'You need to drink at least ',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                        children: <TextSpan>[
                          TextSpan(
                              text: result,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple,
                                  fontSize: 20)),
                          const TextSpan(text: ' glass of water every day'),
                        ],
                      ),
                    )),
              ],
            ),
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
