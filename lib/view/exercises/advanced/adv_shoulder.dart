import 'package:flutter/material.dart';
class AdvancedShoulder extends StatefulWidget {
  const AdvancedShoulder({Key? key}) : super(key: key);

  @override
  _AdvancedShoulderState createState() => _AdvancedShoulderState();
}

class _AdvancedShoulderState extends State<AdvancedShoulder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2a2a35),
        title: const Text('Shoulder workouts'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/4 *1.25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
              child:ListView.builder(
                  itemCount: 10,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey.shade300,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                      ),
                    );

                  })

          ),
        ],
      ),
    );
  }
}
