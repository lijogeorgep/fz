import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fitness_zone/authentication/account.dart';
import "package:flutter/material.dart";
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController(text: "+91");
  final otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;
  late Timer _timer;
  int _start = 70;
  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('isNumber', phoneController.text);
        prefs.setBool('isLogged', true);
        prefs.setString('accountNumber', phoneController.text);
        Navigator.pop(context);
        _scaffoldKey.currentState!.showSnackBar(
            const SnackBar(content: Text("Logged-In successfully")));
        /* Navigator.push(context,
            MaterialPageRoute(builder: (context) => BottomNavigation()));*/
      }
    } on FirebaseAuthException catch (e) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        prefs.setBool('isLogged', false);
        showLoading = false;
      });

      _scaffoldKey.currentState!
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  getMobileFormWidget(context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/phone_with_hand.png',
                      fit: BoxFit.cover,
                    )),
                Positioned(
                    top: 240,
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.blue,
                      child: const Expanded(
                        child: Text(
                          'You will receive a 6 digit code ',
                          style: TextStyle(
                              color: Color(0xff485063),
                              fontSize: 20,
                              letterSpacing: 2.0,
                              fontFamily: 'Righteous'),
                        ),
                      ),
                    )),
              ],
            ),
            // const Spacer(),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.green),
                ),
                helperText: 'enter your mobile number to receive otp',
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
                prefixText: ' ',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            FlatButton(
              onPressed: () async {
                if (phoneController.text.length < 13) {
                  _scaffoldKey.currentState!.showSnackBar(const SnackBar(
                      content: Text("please enter valid number")));
                } else {
                  startTimer();
                  setState(() {
                    showLoading = true;
                  });

                  await _auth.verifyPhoneNumber(
                    phoneNumber: phoneController.text,
                    timeout: const Duration(seconds: 60),
                    verificationCompleted: (phoneAuthCredential) async {
                      setState(() {
                        showLoading = false;
                      });
                      //signInWithPhoneAuthCredential(phoneAuthCredential);
                    },
                    verificationFailed: (verificationFailed) async {
                      setState(() {
                        showLoading = false;
                      });
                      _scaffoldKey.currentState!.showSnackBar(
                          SnackBar(content: Text(verificationFailed.message!)));
                    },
                    codeSent: (verificationId, resendingToken) async {
                      setState(() {
                        showLoading = false;
                        currentState =
                            MobileVerificationState.SHOW_OTP_FORM_STATE;
                        this.verificationId = verificationId;
                      });
                    },
                    codeAutoRetrievalTimeout: (verificationId) async {},
                  );
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Get OTP"),
              ),
              color: const Color(0xFF2a2a35),
              textColor: Colors.white,
            ),
            //   const Spacer(),
          ],
        ),
      ),
    );
  }

  getOtpFormWidget(context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Code has sent to ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  phoneController.text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Otp will timed out in ",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                Text(
                  "$_start seconds",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              controller: otpController,
              decoration: const InputDecoration(
                labelText: 'enter otp',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.green),
                ),
                helperText: 'enter the otp that you have received',
                prefixIcon: Icon(
                  Icons.sms_outlined,
                  color: Colors.green,
                ),
                prefixText: ' ',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FlatButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  PhoneAuthCredential phoneAuthCredential =
                      PhoneAuthProvider.credential(
                          verificationId: verificationId,
                          smsCode: otpController.text);

                  signInWithPhoneAuthCredential(phoneAuthCredential);
                  showNotification();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing....')),
                  );
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("VERIFY"),
              ),
              color: const Color(0xFF2a2a35),
              textColor: Colors.white,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn\'t receive OTP?',
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Account()));
                    },
                    child: const Text('Request again'))
              ],
            )
          ],
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channel.description,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            )));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was publicshed');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title.toString()),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(notification.body.toString()),
                    ],
                  ),
                ),
              );
            });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: const Color(0xFF2a2a35),
          title: const Text('Account Login'),
        ),
        key: _scaffoldKey,
        body: Container(
          child: showLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
          padding: const EdgeInsets.all(16),
        ));
  }

  void showNotification() {
    flutterLocalNotificationsPlugin.show(
      0,
      "Registration",
      "Welcome to Fitness Zone. You have logged in successfully",
      NotificationDetails(
          android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channel.description,
        importance: Importance.high,
        color: Colors.blue,
        playSound: true,
        icon: '@mipmap/ic_launcher',
      )),
    );
  }
}
