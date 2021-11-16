import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_zone/view/diet/diet1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Diet extends StatefulWidget {
  const Diet({Key? key}) : super(key: key);

  @override
  _DietState createState() => _DietState();
}

class _DietState extends State<Diet> {
  final firestoreInstance = FirebaseFirestore.instance;
  List dietImages=[];
  List planTitle=[];
  @override
  void initState() {
    _fetch();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        backgroundColor: const Color(0xFF2a2a35),
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Diet Plans'),
        ),
        automaticallyImplyLeading: false,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Text('Do you want to reduce your body fat ?',style: TextStyle(fontFamily: 'Righteous',fontSize: 19),),
          ),
        ) ,
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text('Choose your diet', style: TextStyle(fontFamily: 'OleoScriptSwashCaps-Bold',fontSize: 20),),
            ),
          ),
          Expanded(

            child: ListView.separated(
              itemCount:dietImages.length,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: const Duration(seconds: 2),
                              pageBuilder: (_, __, ___) =>
                              const Diet1()));
                    },
                    child: Container(
                      height: 120,
                      color: Colors.grey.shade100,
                     child: Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                           child: Image.network(dietImages[index],width: 200,),
                         ),
                         Expanded(child: Padding(
                           padding: const EdgeInsets.all(4.0),
                           child: Text(planTitle[index],style: const TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                         ),),
                       ],
                     ),
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
               height: 20,
              );
            },
            ),
          ),
        ],
      ),
    );
  }
  _fetch() {
    firestoreInstance
        .collection('fitness-zone')
        .doc('diet')
        .get()
        .then((ds) {
      setState(() {

        dietImages=ds['images'];
        planTitle=ds['plan-titles'];


      });
    });
  }
}
