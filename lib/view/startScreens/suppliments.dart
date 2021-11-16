import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_zone/authentication/account.dart';
import 'package:fitness_zone/view/cart/shopping_cart.dart';
import 'package:fitness_zone/view/suppliments/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:badges/badges.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Suppliments extends StatefulWidget {
  const Suppliments({Key? key}) : super(key: key);

  @override
  _SupplimentsState createState() => _SupplimentsState();
}

class _SupplimentsState extends State<Suppliments> {
  int _counter = 0;
  bool showElevatedButtonBadge = true;
  final firestoreInstance = FirebaseFirestore.instance;
  List supplimentsImg = [];
  List price = [];
  List itemName = [];
  List cartItems = [];

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        _counter = 0;
      });
    });
    _fetch();
    _cartItemLength();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2a2a35),
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('supplements'),
        ),
        //centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          _shoppingCartBadge(),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          buildFloatingSearchBar(),
          const Positioned(
              top: 80,
              left: 30,
              child: Text(
                'Body Supplements',
                style: TextStyle(fontFamily: 'Righteous', fontSize: 20),
              )),
          productList(),
        ],
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: FloatingSearchBar(
        hint: 'Search...',
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transitionDuration: const Duration(milliseconds: 800),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        width: isPortrait ? 600 : 500,
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: (query) {},
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: Colors.accents.map((color) {
                  return Container(height: 112, color: color);
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget productList() {
    return Container(
      margin: const EdgeInsets.only(top: 120),
      child: GridView.builder(
          itemCount: supplimentsImg.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.7,
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductDetails()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                          height: 180,
                          child: Center(
                              child: Image.network(supplimentsImg[index]))),
                      Text(
                        itemName[index],
                        style: const TextStyle(
                            fontFamily: 'Righteous', fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '₹' + price[index],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();

                              var checker = prefs.getBool('isLogged');

                              checker == true
                                  ? setState(() {
                                      firestoreInstance
                                          .collection('fitness-zone')
                                          .doc('cart')
                                          .update({
                                        'saved-items': FieldValue.arrayUnion(
                                            [supplimentsImg[index].toString()]),
                                        'item_name': FieldValue.arrayUnion(
                                            [itemName[index].toString()]),
                                        'item_price': FieldValue.arrayUnion(
                                            [price[index].toString()]),
                                      }).then((documentReference) {
                                        setState(() {
                                          _counter++;
                                        });
                                      }).catchError((e) {
                                        print(e);
                                      });
                                    })
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Account()));
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                //  color: Color(0xFF2a2a35),
                                color: Color(0xFFff8b3d),
                              ),
                              child: const Icon(
                                Icons.add_shopping_cart_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  _fetch() {
    firestoreInstance
        .collection('fitness-zone')
        .doc('suppliments')
        .get()
        .then((ds) {
      setState(() {
        supplimentsImg = ds['protienPowders'];
        itemName = ds['product_name'];
        price = ds['price'];
      });
    });
  }

  _cartItemLength() {
    firestoreInstance.collection('fitness-zone').doc('cart').get().then((ds) {
      setState(() {
        cartItems = ds['saved-items'];
        _counter = cartItems.length;
      });
    });
  }

  _shoppingCartBadge() {
    return Badge(
      position: BadgePosition.topEnd(top: 0, end: 3),
      animationDuration: const Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: _counter == cartItems.length
          ? Text(
              _counter.toString(),
              style: const TextStyle(color: Colors.white),
            )
          : Text(_counter.toString(),
              style: const TextStyle(color: Colors.white)),
      child: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();

            var checker = prefs.getBool('isLogged');

            checker == true
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShoppingCart()))
                : Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Account()));
          }),
    );
  }
}
