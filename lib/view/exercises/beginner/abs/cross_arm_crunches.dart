import 'package:flutter/material.dart';

Widget CrossArmCruncehs() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Benefits',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
            'The ab-toning benefits of a full-core workout may have enticed you to add them to your workout routine, but having a strong core can do more than enhance your physique—it also benefits your overall physical health and strength.'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('The muscles of your core provide key support for your spine. Strong abdominal muscles can improve posture and even help manage, reduce, or prevent back pain.'),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Common Mistakes',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('1.Yanking Your Neck'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('2.You Fall Out'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('3.You\'re Going Too Fast',
      ),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('4.You\'re Doing Too Many'),
      ),

    ],
  );
}
