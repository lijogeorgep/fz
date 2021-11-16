
import 'package:flutter/material.dart';

Widget FlatDumbbellBunchPress(){
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: const[
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Why it’s effective',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('“Hitting your pecs is key if you want to bulk up your chest,” King says, “and the flat dumbbell bench press really hones in on that stimulation while targeting your triceps and deltoids.” Dumbbells have a unique advantage over a barbell in that they “develop independent motor control, help iron out dominant-side muscle imbalances, and offer more versatility so you can vary the grip to target slightly different muscles,” he adds. Plus, it’s safer to push to failure during a bench press if you’re using dumbbells because you can bail and dump them, if necessary.'),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Pro tips',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('“If it’s too easy, pause at the bottom of each rep for two seconds to increase time under tension,” King suggests. If it’s too hard, use a lighter load or switch to a neutral grip (palms facing one another) so your lats can support the movement, he adds.'),
      )
    ],
  );
}