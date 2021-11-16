import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fitness_zone/navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  late Razorpay _razorpay;
  final firestoreInstance = FirebaseFirestore.instance;
  List cartItems = [];
  List numberOfItems = [];
  List productName = [];
  List productPrice = [];
  int total=0;
  int cost=0;
  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();

    _fetch();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2a2a35),
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Shopping Cart'),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2 * 1.10,
            child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  //  void addItems() {
                  numberOfItems.add(1);

                  //   }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      //  color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                cartItems[index],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productName[index],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                      Text(
                                        '₹' + productPrice[index],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                      const Text(
                                        '1kg',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    print('item removed');
                                  },
                                  child: const Text(
                                    'REMOVE',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                _decrementButton(index),
                                Text(
                                  '${numberOfItems[index]}',
                                  style: const TextStyle(fontSize: 18.0),
                                ),
                                _incrementButton(index),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          const Divider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'PRICE DETAILS',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0),
                    )),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Price',
                        style:
                            TextStyle(color: Colors.grey, letterSpacing: 2.0),
                      ),
                      Text(
                        '₹'+cost.toString(),
                        style: const TextStyle(letterSpacing: 2.0),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Shipping charge',
                        style:
                            TextStyle(color: Colors.grey, letterSpacing: 2.0),
                      ),
                      Text('₹35', style: TextStyle(letterSpacing: 2.0)),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Discount',
                        style:
                            TextStyle(color: Colors.grey, letterSpacing: 2.0),
                      ),
                      Text('₹100', style: TextStyle(letterSpacing: 2.0)),
                    ]),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        'TOTAL',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            fontSize: 18),
                      ),
                      Text(
                        '₹'+total.toString(),
                        style: const TextStyle(
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ]),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: () async {
            openCheckout();
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFF2a2a35),
            child: const Center(
              child: Text(
                'Place Order',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Righteous',
                    letterSpacing: 3.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _incrementButton(int index) {
    return FloatingActionButton(
      heroTag: "increment",
      mini: true,
      child: const Icon(Icons.add, color: Colors.black87),
      backgroundColor: Colors.white,
      onPressed: () {
        setState(() {

       numberOfItems[index]++;

        });
      },
    );
  }

  Widget _decrementButton(int index) {
    return FloatingActionButton(
        heroTag: "decrement",
        mini: true,
        onPressed: () {
          setState(() {
            numberOfItems[index]--;
          });
        },
        child: const Icon(Icons.remove, color: Colors.black87),
        backgroundColor: Colors.white);
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_Oy9f52Bf7egcEq',
      'amount': 29500,
      'name': 'Test Payment',
      'description': 'This is a Text Payment',
      'prefill': {'contact': '9745801056', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['phonepay']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);

    firestoreInstance.collection('fitness-zone').doc('cart').update({
      'saved-items': FieldValue.arrayRemove(cartItems),
      'item_name': FieldValue.arrayRemove(productName),
      'item_price': FieldValue.arrayRemove(productPrice),
    }).then((documentReference) {
      setState(() {
        print('data removed from db');
      });
    }).catchError((e) {
      print(e);
    });

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return PaymentSuccessful();
    }));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  _fetch() {
    firestoreInstance.collection('fitness-zone').doc('cart').get().then((ds) {
      setState(() {
        cartItems = ds['saved-items'];
        productName = ds['item_name'];
        productPrice = ds['item_price'];
      });
    });
  }
}

class PaymentSuccessful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Payment Successful",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 2.0),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Thank you for your purchase.You can collect your item at Fitness Zone Office with in 7 working days. For more details or product enquiry please contact at following number.',
              textAlign: TextAlign.justify,
              style: TextStyle(letterSpacing: 1, fontSize: 16),
            ),
          ),
          InkWell(
              onTap: () {
                print('tapped');
                _makePhoneCall('tel:9745801056');
              },
              child: const Text(
                'Contact: +919745801056',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    decoration: TextDecoration.underline),
              )),
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            'assets/icons/logo.png',
            scale: 3,
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BottomNavigation())),
            child: Container(
              width: 250,
              padding: const EdgeInsets.all(20),
              color: const Color(0xFF2a2a35),
              child: const Center(
                child: Text(
                  'Go back to Home page',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
