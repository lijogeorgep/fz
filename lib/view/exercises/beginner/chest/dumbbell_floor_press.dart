
import 'package:flutter/material.dart';

Widget DumbbellFloorPress(){
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: const[
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Why it’s effective',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(' “The floor press is an underrated exercise that targets the chest, core, triceps, and stabilizing shoulder muscles, which all increase power,” King says. “Plus, if you suffer from shoulder or lower back pain when you press, then this exercise is a must, because being flat on the floor gives you constant feedback on whether you’re in the correct position.”'),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Pro tips',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(' If it’s too easy, lie flat instead of bending your knees and planting your feet. If it’s too hard, switch to pushups to strengthen your pecs.'),
      ),
    ],
  );
}