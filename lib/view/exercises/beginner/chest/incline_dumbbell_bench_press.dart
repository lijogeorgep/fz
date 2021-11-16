
import 'package:flutter/material.dart';

Widget InclineDumbbellBenchPress(){
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: const[
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Why it’s effective',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(' “Holding the weights closer together allows an increased range of motion, helping recruit all the motor units available in your pecs,” King says. “To maximize results, squeeze your pecs at the top of the move. Your muscles will learn which need to fire and which can relax, placing the maximum stress on the right muscles.”'),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Pro tips',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('If it’s too easy, shorten the rest period or increase the load. If it’s too hard, switch back to a flat dumbbell chest press.'),
      ),
    ],
  );
}