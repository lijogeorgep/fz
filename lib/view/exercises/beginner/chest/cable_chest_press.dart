
import 'package:flutter/material.dart';

Widget CableChestPress(){
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: const[
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Why it’s effective',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('The cables stimulate your muscles differently from free weights, because you’re working against constant resistance. “The dynamic nature of having a load pulling you back while you press increases time under tension on the muscle, which increases protein synthesis and growth,” King says.'),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Pro tips',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('If it’s too easy, try to touch the palms of your hands together while keeping your shoulders back. If it’s too hard, use a light resistance band anchored to something secure and mimic the motion to condition your muscles.'),
      ),
    ],
  );
}