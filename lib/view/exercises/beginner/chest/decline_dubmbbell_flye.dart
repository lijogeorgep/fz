
import 'package:flutter/material.dart';

Widget DeclineDumbbellFlye(){
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: const[
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Why it’s effective',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('“Building big muscles that maintain mobility isn’t an easy thing to do, but dumbbell flyes build sculpted, 3D-looking pecs that can perform as well as they look,” King says. It’s all because of the “stretch and contract” relationship. “One of the most proven ways to grow new muscle fibers is to stretch the desired area under load, then contract the muscle, which stimulates growth through fatigue,” he explains. In this case, once you release the stretched position, there’s a surge of blood, which helps deliver protein.'),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Pro tips',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('If it’s too easy, decline the angle of the bench more to really target your upper pecs, King says. And if it’s too difficult, switch over to the cable machine flye.'),
      )
    ],
  );
}