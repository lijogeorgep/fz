import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_zone/navigation/bottom_navigation.dart';
import 'package:fitness_zone/view/exercises/advanced/adv_abs.dart';
import 'package:fitness_zone/view/exercises/advanced/adv_biceps.dart';
import 'package:fitness_zone/view/exercises/advanced/adv_chest.dart';
import 'package:fitness_zone/view/exercises/advanced/adv_lats.dart';
import 'package:fitness_zone/view/exercises/advanced/adv_leg.dart';
import 'package:fitness_zone/view/exercises/advanced/adv_shoulder.dart';
import 'package:fitness_zone/view/exercises/advanced/adv_triceps.dart';
import 'package:fitness_zone/view/exercises/beginner/abs.dart';
import 'package:fitness_zone/view/exercises/beginner/biceps.dart';
import 'package:fitness_zone/view/exercises/beginner/chest.dart';
import 'package:fitness_zone/view/exercises/beginner/lats.dart';
import 'package:fitness_zone/view/exercises/beginner/leg.dart';
import 'package:fitness_zone/view/exercises/beginner/shoulder.dart';
import 'package:fitness_zone/view/exercises/beginner/triceps.dart';
import 'package:fitness_zone/authentication/account.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SingingCharacter { Beginner, Advanced }

class Exercise extends StatefulWidget {
  const Exercise({Key? key}) : super(key: key);

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  SingingCharacter? _character = SingingCharacter.Beginner;
  final firestoreInstance = FirebaseFirestore.instance;
  List beginners = [];
  List professionals = [];
  List bImages = [];
  List advImages = [];
  List beginnerWorkoutPages = [
    const Abs(),
    const Chest(),
    const Biceps(),
    const Triceps(),
    const Leg(),
    const Lats(),
    const Shoulder(),
  ];
  List advancedWorkoutPages = [
    const AdvancedAbs(),
    const AdvancedChest(),
    const AdvancedBiceps(),
    const AdvancedTriceps(),
    const AdvancedLeg(),
    const AdvancedLats(),
    const AdvancedShoulder(),
  ];
  bool isLoaded = false;
  String? accountNumber;

  @override
  initState() {
    const fiveSeconds = Duration(seconds: 1);
    Timer.periodic(fiveSeconds, (Timer t) => _fetchData());

    _fetch();

    super.initState();
  }

  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      accountNumber = prefs.getString('accountNumber');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2a2a35),
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Fitness Zone'),
        ),
        // centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          accountNumber == null
              ? const Center(child: Text(""))
              : Center(child: Text(accountNumber!)),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Account()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              setState(() {
                prefs.clear();
                isLoading = false;

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavigation()));
              });
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Text(
              'Find your workout',
              style: TextStyle(fontFamily: 'Righteous', fontSize: 20),
            ),
          ),
          SizedBox(
            height:60,
            width: MediaQuery.of(context).size.width,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width/2,
                  child: ListTile(
                    title: const Text('Beginner'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.Beginner,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                          isLoaded = false;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(

                 height: 60,
                  width: MediaQuery.of(context).size.width/2,
                  child: ListTile(
                    title: const Text('Advanced'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.Advanced,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                          isLoaded = true;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
      Expanded(
        child:isLoaded == false ? beginner() : advanced(),       ),

        ],
      ),
    );
  }

  _fetch() {
    firestoreInstance
        .collection('fitness-zone')
        .doc('exercises')
        .get()
        .then((ds) {
      setState(() {
        bImages = ds['beginnerImages'];
        advImages = ds['advancedImages'];
      });
    });
  }

  beginner() {
    return ListView.separated(
      itemCount: bImages.length,
      scrollDirection: Axis.vertical,
      physics: const ScrollPhysics(),

      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => beginnerWorkoutPages[index])),
            child: Container(

              width: MediaQuery.of(context).size.width,
              height: 250,
              color: Colors.grey.shade300,
              child: Image.network(
                bImages[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 15,
        );
      },
    );
  }

  advanced() {
    return ListView.separated(
      itemCount: advImages.length,
      scrollDirection: Axis.vertical,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => advancedWorkoutPages[index])),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  color: Colors.grey.shade300,
                  child: Image.network(
                    advImages[index],
                    fit: BoxFit.cover,
                  )),
            ));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 10,
        );
      },
    );
  }

  _fetchData() {
    loadCounter();
  }
}
