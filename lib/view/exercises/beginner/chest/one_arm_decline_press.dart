
import 'package:flutter/material.dart';

Widget OneArmDeclineDumbbellPress(){
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: const[
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Why it’s effective',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('The one-arm decline dumbbell bench press places the central nervous system under stress, raising your heart rate and turning this strength exercise into a conditioning one to create a lean yet pumped-up physique, King says.'),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Pro tips',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('If it’s too easy, increase the load. If it’s too hard, build strength with the dumbbell chest press for about four weeks.'),
      ),
    ],
  );
}