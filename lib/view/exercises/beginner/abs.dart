import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_zone/view/exercises/beginner/abs/cross_arm_crunches.dart';
import 'package:fitness_zone/view/exercises/beginner/abs/crunches.dart';
import 'package:fitness_zone/view/exercises/beginner/abs/double_crunches.dart';
import 'package:fitness_zone/view/exercises/beginner/abs/feet_to_feet_crunches.dart';
import 'package:fitness_zone/view/exercises/beginner/abs/full_vertical_crunches.dart';
import 'package:fitness_zone/view/exercises/beginner/abs/legup_crunches.dart';
import 'package:fitness_zone/view/exercises/beginner/abs/montain_climber.dart';
import 'package:fitness_zone/view/exercises/beginner/abs/plank.dart';
import 'package:fitness_zone/view/exercises/beginner/abs/russian_twist.dart';
import 'package:fitness_zone/view/exercises/beginner/abs/side_plank.dart';

import 'package:flutter/material.dart';

import 'abs/bicycle_crunches.dart';
import 'abs/vups.dart';

class Abs extends StatefulWidget {
  const Abs({Key? key}) : super(key: key);

  @override
  _AbsState createState() => _AbsState();
}

class _AbsState extends State<Abs> {
  final firestoreInstance = FirebaseFirestore.instance;
  List beginerThumbnails = [];
  List beginerVideos = [];
  List beginnerAbsExcerciseNames = [];
  List b = [
    Vups(),
    BicycleCruncehs(),
    CrossArmCruncehs(),
    DoubleCruncehs(),
    LegUpCruncehs(),
    MountainClimber(),
    Plank(),
    RussianTwist(),
    FeetToFeetCruncehs(),
    SidePlank(),
    FullVerticalCruncehs()
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
          child: Text('abs workouts'),
        ),
      ),
      body: ListView.builder(
        itemCount: beginerThumbnails.length,
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
                          url = beginerVideos[index];
                          var p = b[index];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Crunches(
                                url: url,
                                pages: p,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.network(
                      beginerThumbnails[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  beginnerAbsExcerciseNames[index],
                  style: TextStyle(fontFamily: 'Righteous', fontSize: 16),
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
            beginerThumbnails = ds['absBeginnerThumbnails'];
            beginerVideos = ds['absBeginner'];
            beginnerAbsExcerciseNames = ds['absExercise_names'];
          },
        );
      },
    );
  }
}
