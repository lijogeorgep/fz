
import 'package:flutter/cupertino.dart';

Widget Vups(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: const[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Benefits of V-Ups',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Stronger Core Muscles'),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Low Back Health'),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Improved Balance'),
        ),

SizedBox(height: 20,),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('What Muscles Do V-Ups Work?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('V-Ups is an abdominal exercise that strengthens your lower and upper abs, helps train your core stability, and strengthens and protects your low back.'),
      ),
        SizedBox(height: 20,),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('How Many Calories Do V-Ups Burn?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Bottom line – the harder you work, the more calories you burn. V-ups benefits show less in a calorie burn and more in a core strength benefit.'),
      ),

    ],
  );
}