
import 'package:flutter/material.dart';

Widget BarbbellBunchPress(){
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: const[
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Why it’s effective',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(' “Once you’ve mastered pushups, you know you’re ready for this juggernaut of an upper-body exercise,” King says. The bench press activates your lats, glutes, core, chest, triceps—and a good legs drive—so it’s a great functional move that’ll shape and add size to your entire upper body, he adds.  '),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Pro tips',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('“If it’s too easy, slow down the lowering phase to three seconds for each rep,” King recommends. If it’s too hard, lower the weight. Have a partner spot you in the beginning and as you add weight.'),
      )
    ],
  );
}