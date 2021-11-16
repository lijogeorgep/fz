import 'package:flutter/material.dart';

Widget DoubleCruncehs() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Muscles involved',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
            'The double crunch targets a range of musculature in your core, including the following:'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('1.rectus abdominis'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('2.rectus femoris'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('3. external and internal obliques'),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Benefits of the double crunch',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('The benefits of the double crunch involve strengthening your overall core musculature.'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('In particular, research suggests that the upper and lower rectus abdominis muscles are heavily targeted in abdominal crunch and bent-knee sit-up exercises, which are similar to the double crunch'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Furthermore, additional research found that abdominal crunches better activate the rectus femoris compared with similar exercises using the Ab Lounge device'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Although standard abdominal crunches don’t involve bringing your knees to your chest, both the standard and double crunches involve flexing your torso, making them comparable exercises in terms of rectus abdominis activity.'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
            'Common error',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('1.arched low back'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
            '2.crunching the neck'),
      )
    ],
  );
}
