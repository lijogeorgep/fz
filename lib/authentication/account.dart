import 'package:fitness_zone/authentication/loginscreen.dart';
import 'package:fitness_zone/navigation/bottom_navigation.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? haveNumber;
bool isLoading = true;
User? _user;

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final snackBar = SnackBar(content: const Text('yor are already logged in'));
  FirebaseAuth? _auth;

  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      haveNumber = prefs.getString('isNumber');
      print("haveNumber");
      print(haveNumber);
    });
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth?.currentUser;
    isLoading = false;

    loadCounter();
  }

  @override
  Widget build(BuildContext context) {
    return haveNumber != null
        ? BottomNavigation()
        : isLoading
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : /*_user == null
                ? LoginScreen()
                :*/ LoginScreen();
  }
}
