
import 'package:flutter/material.dart';

Widget MedicineBallChestThrow(){
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: const[
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Why it’s effective',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('“Take a kneeling position facing a wall or get a training partner involved to make this move more competitive,” King says. Hold the medicine ball with both hands at chest height. Garnering as much power as possible, throw the ball straight at the wall or your partner, following through with your hands as if you were mimicking the pressing portion of an explosive pushup, King explains. You’ll naturally fall forward a bit. '),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Pro tips',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(' If it’s too easy, lie on your back and throw the ball in the air, catching it, and repeating quickly and explosively. If it’s too hard, stand up and execute against a wall.'),
      )
    ],
  );
}