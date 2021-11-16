
import 'package:flutter/material.dart';

Widget CableCrossOver(){
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: const[
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Why it’s effective',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('When looking for a full, round chest, it’s important to hit some isolation work that really targets just the pecs, King says. “The bilateral aspect of the cable crossover allows you to strengthen your weaker side, whereas compound movements won’t always work on muscle imbalances,” he adds. “For maximum definition, it’s key to place muscles under as much stress as possible.”'),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Pro tips',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('If it’s too easy, pause for 2-3 seconds while the cables are crossed to fatigue your pecs, King suggests. If it’s too hard, don’t cross over, and stop when the hands are close (as pictured above).'),
      ),
    ],
  );
}