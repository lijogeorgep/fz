
import 'package:flutter/material.dart';

Widget PushUp(){
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: const[
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Why it’s effective',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('“You’d never build a house on a soft, shaky foundation,” King says. “This is the reason mastering the pushup is paramount, and the place to start for all beginners.” Don’t rush your progress. It’s a simple move, but many struggle to execute correctly.'),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Pro tips',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),

      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(' If it feels too easy, take a slightly narrower grip or elevate your feet, King suggests. If it feels too hard, start on your knees, or elevate your hands, positioning them on a chair or bench while your feet are on the floor.'),
      )
    ],
  );
}