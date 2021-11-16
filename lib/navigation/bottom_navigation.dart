import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:fitness_zone/view/startScreens/diet.dart';
import 'package:fitness_zone/view/startScreens/exercises.dart';
import 'package:fitness_zone/view/startScreens/suppliments.dart';
import 'package:fitness_zone/view/startScreens/utility.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Exercise(),
    Suppliments(),
    Diet(),
    Utility(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _selectedIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const ImageIcon(
              AssetImage('assets/icons/dumbbel - Copy.png'),
            ),
            title: const Text(
              'Exercises',
              style: TextStyle(color: Colors.black),
            ),
            activeColor: Colors.orange,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const ImageIcon(
              AssetImage('assets/icons/suppliment.png'),
            ),
            title: const Text(
              'Suppliment',
              style: TextStyle(color: Colors.black),
            ),
            activeColor: Colors.orange,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const ImageIcon(
              AssetImage('assets/icons/diet.png'),
            ),
            title: const Text(
              'Diet',
              style: TextStyle(color: Colors.black),
            ),
            activeColor: Colors.orange,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const ImageIcon(
              AssetImage('assets/icons/utilities.png'),
            ),
            title: const Text(
              'Utility',
              style: TextStyle(color: Colors.black),
            ),
            activeColor: Colors.orange,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
