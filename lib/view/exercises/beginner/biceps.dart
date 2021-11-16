import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_zone/view/exercises/beginner/biceps/alternating_incline_dumbbell_curl.dart';
import 'package:fitness_zone/view/exercises/beginner/biceps/biceps_workouts.dart';
import 'package:fitness_zone/view/exercises/beginner/biceps/concentration_curl.dart';
import 'package:fitness_zone/view/exercises/beginner/biceps/seated_alternating_dumbbell_curl.dart';
import 'package:fitness_zone/view/exercises/beginner/biceps/seated_alternating_hammer_curl.dart';
import 'package:fitness_zone/view/exercises/beginner/biceps/standing_cable_curl.dart';
import 'package:fitness_zone/view/exercises/beginner/biceps/standing_reverse_barbell_curl.dart';
import 'package:flutter/material.dart';

class Biceps extends StatefulWidget {
  const Biceps({Key? key}) : super(key: key);

  @override
  _BicepsState createState() => _BicepsState();
}

class _BicepsState extends State<Biceps> {
  final firestoreInstance = FirebaseFirestore.instance;
  List beginnerBicepsThumbnails = [];
  List beginnerBicepsVideos = [];
  List beginnerBicepsExcerciseNames = [];
  List b = [
    AlternatingInclineDumbbellCurl(),
    SeatedAlternatingHammerCurl(),
    StandingReverseBarbellCurl(),
    SeatedAlternatingDumbbellCurl(),
    StandingCableCurl(),
    ConcentrationCurl()
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
          child: Text('Biceps workouts'),
        ),
      ),
      body: ListView.builder(
        itemCount: beginnerBicepsThumbnails.length,
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
                          url = beginnerBicepsVideos[index];
                          var p = b[index];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BicepsWorkouts(
                                url: url,
                                pages: p,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.network(
                      beginnerBicepsThumbnails[index],
                      fit: BoxFit.fill,
                      alignment: AlignmentDirectional.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  beginnerBicepsExcerciseNames[index],
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
            beginnerBicepsThumbnails = ds['beginerBicepsThumbnails'];
            beginnerBicepsVideos = ds['beginerBicepsVideos'];
            beginnerBicepsExcerciseNames = ds['beginerBicepsExerciseNames'];
          },
        );
      },
    );
  }
}
