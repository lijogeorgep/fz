import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_zone/view/exercises/beginner/chest/barbbell_bunch_press.dart';
import 'package:fitness_zone/view/exercises/beginner/chest/cable_chest_press.dart';
import 'package:fitness_zone/view/exercises/beginner/chest/cable_crossover.dart';
import 'package:fitness_zone/view/exercises/beginner/chest/decline_dubmbbell_flye.dart';
import 'package:fitness_zone/view/exercises/beginner/chest/dumbbell_floor_press.dart';
import 'package:fitness_zone/view/exercises/beginner/chest/flat_bumbbell_bunch_press.dart';
import 'package:fitness_zone/view/exercises/beginner/chest/incline_dumbbell_bench_press.dart';
import 'package:fitness_zone/view/exercises/beginner/chest/medicine_ball_chest_throw.dart';
import 'package:fitness_zone/view/exercises/beginner/chest/one_arm_decline_press.dart';
import 'package:fitness_zone/view/exercises/beginner/chest/push_up.dart';
import 'package:flutter/material.dart';

import 'chest/chest_workouts.dart';

class Chest extends StatefulWidget {
  const Chest({Key? key}) : super(key: key);

  @override
  _ChestState createState() => _ChestState();
}

class _ChestState extends State<Chest> {
  final firestoreInstance = FirebaseFirestore.instance;
  List beginnerChestThumbnails = [];
  List beginnerChestVideos = [];
  List beginnerChestExcerciseNames = [];
  List b = [
    PushUp(),
    BarbbellBunchPress(),
    MedicineBallChestThrow(),
    FlatDumbbellBunchPress(),
    DeclineDumbbellFlye(),
    CableChestPress(),
    InclineDumbbellBenchPress(),
    DumbbellFloorPress(),
    CableCrossOver(),
    OneArmDeclineDumbbellPress(),
  ];
  late Object page;
  String? url;

  @override
  void initState() {
    _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2a2a35),
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Chest workouts'),
        ),
      ),
      body: ListView.builder(
        itemCount: beginnerChestThumbnails.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.grey.shade300,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          url = beginnerChestVideos[index];
                          var p = b[index];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChestWorkouts(
                                url: url,
                                pages: p,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.network(
                      beginnerChestThumbnails[index],
                      fit: BoxFit.fill,
                      alignment: AlignmentDirectional.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  beginnerChestExcerciseNames[index],
                  style: const TextStyle(fontFamily: 'Righteous', fontSize: 16),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _fetch() {
    firestoreInstance.collection('fitness-zone').doc('exercises').get().then(
      (ds) {
        setState(
          () {
            beginnerChestThumbnails = ds['beginerChestThumbnails'];
            beginnerChestVideos = ds['beginnerChestVideos'];
            beginnerChestExcerciseNames = ds['beginerChestExerciseNames'];
          },
        );
      },
    );
  }
}
