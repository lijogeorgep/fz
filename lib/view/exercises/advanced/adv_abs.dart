import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_zone/view/exercises/advanced/crunches.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvancedAbs extends StatefulWidget {
  const AdvancedAbs({Key? key}) : super(key: key);

  @override
  _AdvancedAbsState createState() => _AdvancedAbsState();
}

class _AdvancedAbsState extends State<AdvancedAbs> {
  final firestoreInstance = FirebaseFirestore.instance;
  List advancedThumbnails = [];
  List advancedVideos = [];
  List advancedAbsExcerciseNames = [];
  List b = [];
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
        itemCount: advancedVideos.length,
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
                          url = advancedVideos[index];
                          // var p = b[index];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Crunches(
                                url: url,
                                //  pages: p,
                              ),
                            ),
                          );
                        },
                      );
                    },

                     child: Image.network(
                        advancedThumbnails[index],
                       fit: BoxFit.fill,

                       alignment: AlignmentDirectional.center,
                      ),
                  ),
                ),
              ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  advancedAbsExcerciseNames[index],
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
            advancedThumbnails = ds['absAdvancedThumbnails'];
            advancedVideos = ds['absAdvanced'];
            advancedAbsExcerciseNames = ds['advancedAbsExerciseNames'];
          },
        );
      },
    );
  }
}
