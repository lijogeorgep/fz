import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_zone/navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void _instanceId() async {
   // await Firebase.initializeApp();
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.instance.sendMessage();
    var token = await FirebaseMessaging.instance.getToken();
    print("Print Instance Token ID: " + token!);
  }

  @override
  void initState() {
    super.initState();
    _instanceId();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
           height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration:BoxDecoration(
            image:DecorationImage(
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
              image:AssetImage('assets/images/log-bg.jpg',),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),

          ),
          child: Stack(
            children: [
           /*   Container(
                height: 250,
                width: MediaQuery.of(context).size.width/2*1.25,
                color: Colors.red,
              ),*/
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 200,
            width: MediaQuery.of(context).size.width,
            child: Center(child: Image.asset('assets/icons/logo.png',scale: 3,))),
              Positioned(
                bottom:30,

                left: MediaQuery.of(context).size.width/2*1.15,
                child: GestureDetector(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                    decoration: BoxDecoration(
gradient: LinearGradient(colors: [Colors.grey.shade900,Color(0xFFD4AF37),],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,

),
                      borderRadius: BorderRadius.circular(20.0),
                      //color: Color(0xFFD4AF37),

                    ),

                    child: Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.lightBlueAccent,
                    child: GestureDetector(
                      onTap: (){
                        FirebaseInAppMessaging.instance.triggerEvent("");

                        FirebaseMessaging.instance.sendMessage();

                        FirebaseMessaging.instance.getInitialMessage();
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>BottomNavigation()) );},
                        child: Text('Enter',style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Righteous',letterSpacing: 3.0),))),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
