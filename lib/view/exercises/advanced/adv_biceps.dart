import 'package:flutter/material.dart';
class AdvancedBiceps extends StatefulWidget {
  const AdvancedBiceps({Key? key}) : super(key: key);

  @override
  _AdvancedBicepsState createState() => _AdvancedBicepsState();
}

class _AdvancedBicepsState extends State<AdvancedBiceps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2a2a35),
        title: const Text('Biceps workouts'),
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
