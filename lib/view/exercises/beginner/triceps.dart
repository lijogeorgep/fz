import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_zone/view/exercises/beginner/triceps/bench_dip.dart';
import 'package:fitness_zone/view/exercises/beginner/triceps/cable_push_down.dart';
import 'package:fitness_zone/view/exercises/beginner/triceps/single_arm_kick_back.dart';
import 'package:fitness_zone/view/exercises/beginner/triceps/triceps_workouts.dart';
import 'package:flutter/material.dart';
class Triceps extends StatefulWidget {
  const Triceps({Key? key}) : super(key: key);

  @override
  _TricepsState createState() => _TricepsState();
}

class _TricepsState extends State<Triceps> {
  final firestoreInstance = FirebaseFirestore.instance;
  List beginerTricepsThumbnails = [];
  List beginerTricepsVideos = [];
  List beginerTricepsExcerciseNames = [];
  List b = [
BenchDip(),
    CablePushDown(),
    SingleArmKickBack(),

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
        itemCount: beginerTricepsThumbnails.length,
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
                          url = beginerTricepsVideos[index];
                          var p = b[index];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TricepsWorkouts(
                                url: url,
                                pages: p,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.network(
                      beginerTricepsThumbnails[index],
                      fit: BoxFit.fill,
                      alignment: AlignmentDirectional.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  beginerTricepsExcerciseNames[index],
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
            beginerTricepsThumbnails = ds['beginerTricepsThumbnails'];
            beginerTricepsVideos = ds['beginerTricepsVideos'];
            beginerTricepsExcerciseNames = ds['beginerTricepsExcerciseNames'];
          },
        );
      },
    );
  }
}
