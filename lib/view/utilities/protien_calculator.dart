import 'package:flutter/material.dart';
class ProteinCalculator extends StatefulWidget {
  const ProteinCalculator({Key? key}) : super(key: key);

  @override
  _ProteinCalculatorState createState() => _ProteinCalculatorState();
}

class _ProteinCalculatorState extends State<ProteinCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: const Color(0xFF2a2a35),
      title: const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text('Protein Calculator'),
      ),
    ),);
  }
}
