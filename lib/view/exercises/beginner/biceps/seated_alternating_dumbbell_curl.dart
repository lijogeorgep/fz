
import 'package:flutter/material.dart';

Widget  SeatedAlternatingDumbbellCurl(){
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: const[

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('When you’re making a list of the best exercises for biceps, you simply cannot ignore the dumbbell curl. One of the most iconic and simple movements, curls are great for activating your forearm and upper arm muscles. However, research published in the Journal of Sports Science and Medicine shows that the Seated Alternating variation is the best version of the iconic bicep exercise. This take reportedly activated your upper muscles far better than other curl variations.'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('As with most lifting, the heavier the weight, the stronger you’ll get, however, it is important to make sure you contact at the top of the movement. To perform an a Seated Alternating Dumbbell Curl properly;'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('1.Sit on a 90-degree bench with a dumbbell in each hand and palms facing forward.'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('2.Keeping your elbows and shoulders stationary, slowly lift the weight to the front of your shoulders.'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('3.Pause, squeezing your bicep at the top.'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('4.Slowly reverse the movement to return to start.'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('5.Repeat on the opposite side.'),
      ),
    ],
  );
}