import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Diet1 extends StatefulWidget {
  const Diet1({Key? key}) : super(key: key);

  @override
  _Diet1State createState() => _Diet1State();
}

class _Diet1State extends State<Diet1> {
  final firestoreInstance = FirebaseFirestore.instance;
  List dietImages = [];
  String bullet = "\u2022 ";
  @override
  void initState() {
    _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: const Color(0xFF2a2a35),


      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4 * 1.25,
                child: ListView.builder(
                  itemCount: dietImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      dietImages[index],
                      width: 200.0,
                    );
                  },
                ),
              ),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                child: Text('A Week of Healthy Meal Plans',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 10,),
              /// Day 1
              ExpansionTile(
                title:   const Text(
                  'Day 1',
                  style: TextStyle(
                      fontFamily: 'Righteous', fontSize: 20),
                ),
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Today\'s meal plan contains about 2,250 calories, with 55% of those calories coming from carbohydrates, 20% from fat, and 25% from protein. It also has about 34 grams of fiber.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  /// break fast
                  ExpansionTile(
                    title:const Text(
                      'Breakfast',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One grapefruit'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('Two poached eggs (or fried in a non-stick pan)'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Two slices whole-grain toast with one pat of butter each')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One cup low-fat milk'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One cup of black coffee or herbal tea'),
                        ],
                      ),
                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One banana'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One cup plain yogurt with two tablespoons honey'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Glass of water')),
                        ],
                      ),

                    ],
                  ),
                  /// lunch
                  ExpansionTile(
                    title:const Text(
                      'Lunch',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Chicken breast (6-ounce portion), baked or roasted \n(not breaded or fried)')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Large garden salad with tomato and onion with one cup croutons, topped with one tablespoon oil and vinegar (or salad dressing)')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Glass of water')),
                        ],
                      ),

                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup carrot slices')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Three tablespoons hummus')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One-half piece of pita bread')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Glass of water or herbal tea')),
                        ],
                      ),
                    ],
                  ),
                  /// dinner
                  ExpansionTile(
                    title:const Text(
                      'Dinner',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup steamed broccoli')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup of brown rice')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Halibut (four-ounce portion)')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Small garden salad with one cup spinach leaves, tomato, and onion topped with two tablespoons oil and vinegar or salad dressing')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One glass white wine (regular or dealcoholized)')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Sparkling water with lemon or lime slice')),
                        ],
                      ),
                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup blueberries')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Two tablespoons whipped cream (the real stuff—whip your own or buy in a can)')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Glass of water')),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
              /// Day 2
              ExpansionTile(
                title:   const Text(
                  'Day 2',
                  style: TextStyle(
                      fontFamily: 'Righteous', fontSize: 20),
                ),
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                     'If you eat this whole menu, you get about 2,150 calories, with 51% of those calories coming from carbohydrates, 21% from fat, and 28% from protein. The meal plan also has 30 grams of fiber.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  /// break fast
                  ExpansionTile(
                    title:const Text(
                      'Breakfast',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One whole-wheat English muffin with two tablespoons peanut butter')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One orange'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Large glass (12 ounces) non-fat milk')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One cup of black coffee or herbal tea'),
                        ],
                      ),

                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('Two oatmeal cookies with raisins'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('Glass of water, hot tea, or black coffee'),
                        ],
                      ),


                    ],
                  ),
                  /// lunch
                  ExpansionTile(
                    title:const Text(
                      'Lunch',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Chicken breast (6-ounce portion), bA turkey sandwich (six ounces of turkey breast meat, large tomato slice, green lettuce and mustard on two slices of whole wheat bread')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup low-sodium vegetable soup')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Glass of water')),
                        ],
                      ),

                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup (about 30) grapes')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('TGlass of water or herbal tea')),
                        ],
                      ),

                    ],
                  ),
                  /// dinner
                  ExpansionTile(
                    title:const Text(
                      'Dinner',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Five-ounce sirloin steak')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup mashed potatoes')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup cooked spinach')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup green beans')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One glass beer (regular, lite or non-alcohol)')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Sparkling water with lemon or lime slice')),
                        ],
                      ),
                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Two slices whole wheat bread with two tablespoons jam (any variety of fruit)')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Two tablespoons whipped cream (the real stuff—whip your own or buy in a can)')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup non-fat milk')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Glass of water')),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              /// Day 3
              ExpansionTile(
                title:   const Text(
                  'Day 3',
                  style: TextStyle(
                      fontFamily: 'Righteous', fontSize: 20),
                ),
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Today\'s meal has about 2,260 calories, with 55% of those calories coming from carbohydrates, 20% from fat, and 25% from protein. It also has 50 grams of fiber.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  /// break fast
                  ExpansionTile(
                    title:const Text(
                      'Breakfast',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One medium bran muffin')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One serving turkey breakfast sausage'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One orange')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One cup non-fat milk'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One cup black coffee or herbal tea'),
                        ],
                      ),

                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One fresh pear'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One cup of flavored soy milk'),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('Glass of water, hot tea, or black coffee'),
                        ],
                      ),
                    ],
                  ),
                  /// lunch
                  ExpansionTile(
                    title:const Text(
                      'Lunch',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Low sodium chicken noodle soup with six saltine crackers')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One medium apple')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Water')),
                        ],
                      ),

                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One apple')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One slice Swiss cheese')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Sparkling water with lemon or lime slice')),
                        ],
                      ),

                    ],
                  ),
                  /// dinner
                  ExpansionTile(
                    title:const Text(
                      'Dinner',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('8-ounce serving of turkey breast meat')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup baked beans')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup cooked carrots')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup cooked kale')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One glass of wine')),
                        ],
                      ),

                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup of frozen yogurt')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup fresh raspberries')),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
              /// Day 4
              ExpansionTile(
                title:   const Text(
                  'Day 4',
                  style: TextStyle(
                      fontFamily: 'Righteous', fontSize: 20),
                ),
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'By the end of today, you\'ll consume about 2,230 calories, with 54% of those calories coming from carbohydrates, 24% from fat, and 22% from protein. You\'ll also get about 27 grams of fiber.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  /// break fast
                  ExpansionTile(
                    title:const Text(
                      'Breakfast',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup whole wheat flakes with one cup non-fat milk and one teaspoon sugar')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One banana'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One slice whole-grain toast with one tablespoon peanut butter')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One cup of black coffee or herbal tea'),
                        ],
                      ),


                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One cup grapes and one tangerine'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('Glass of water, hot tea, or black coffee'),
                        ],
                      ),


                    ],
                  ),
                  /// lunch
                  ExpansionTile(
                    title:const Text(
                      'Lunch',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Tuna wrap with one wheat flour tortilla, one-half can water-packed tuna (drained), one tablespoon mayonnaise, lettuce, and sliced tomato')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One sliced avocado')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup non-fat milk')),
                        ],
                      ),

                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup cottage cheese (1-percent fat)')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One fresh pineapple slice')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Four graham crackers')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Sparkling water with lemon or lime slice')),
                        ],
                      ),


                    ],
                  ),
                  /// dinner
                  ExpansionTile(
                    title:const Text(
                      'Dinner',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One serving lasagna')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Small garden salad with tomatoes and onions topped with one tablespoon salad dressing')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup non-fat milk')),
                        ],
                      ),


                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One apple')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup non-fat milk')),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
              /// Day 5
              ExpansionTile(
                title:   const Text(
                  'Day 5',
                  style: TextStyle(
                      fontFamily: 'Righteous', fontSize: 20),
                ),
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'By the end of today, you\'ll consume about 2,230 calories, with 54% of those calories coming from carbohydrates, 24% from fat, and 22% from protein. You\'ll also get about 27 grams of fiber.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  /// break fast
                  ExpansionTile(
                    title:const Text(
                      'Breakfast',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup whole wheat flakes with one cup non-fat milk and one teaspoon sugar')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One banana'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One slice whole-grain toast with one tablespoon peanut butter')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One cup of black coffee or herbal tea'),
                        ],
                      ),


                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One cup grapes and one tangerine'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('Glass of water, hot tea, or black coffee'),
                        ],
                      ),


                    ],
                  ),
                  /// lunch
                  ExpansionTile(
                    title:const Text(
                      'Lunch',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Tuna wrap with one wheat flour tortilla, one-half can water-packed tuna (drained), one tablespoon mayonnaise, lettuce, and sliced tomato')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One sliced avocado')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup non-fat milk')),
                        ],
                      ),

                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup cottage cheese (1-percent fat)')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One fresh pineapple slice')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Four graham crackers')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Sparkling water with lemon or lime slice')),
                        ],
                      ),


                    ],
                  ),
                  /// dinner
                  ExpansionTile(
                    title:const Text(
                      'Dinner',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One serving lasagna')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Small garden salad with tomatoes and onions topped with one tablespoon salad dressing')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup non-fat milk')),
                        ],
                      ),


                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One apple')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup non-fat milk')),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
              /// Day 6
              ExpansionTile(
                title:   const Text(
                  'Day 6',
                  style: TextStyle(
                      fontFamily: 'Righteous', fontSize: 20),
                ),
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'By the end of today, you\'ll consume about 2,230 calories, with 54% of those calories coming from carbohydrates, 24% from fat, and 22% from protein. You\'ll also get about 27 grams of fiber.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  /// break fast
                  ExpansionTile(
                    title:const Text(
                      'Breakfast',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup whole wheat flakes with one cup non-fat milk and one teaspoon sugar')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One banana'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One slice whole-grain toast with one tablespoon peanut butter')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One cup of black coffee or herbal tea'),
                        ],
                      ),


                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One cup grapes and one tangerine'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('Glass of water, hot tea, or black coffee'),
                        ],
                      ),


                    ],
                  ),
                  /// lunch
                  ExpansionTile(
                    title:const Text(
                      'Lunch',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Tuna wrap with one wheat flour tortilla, one-half can water-packed tuna (drained), one tablespoon mayonnaise, lettuce, and sliced tomato')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One sliced avocado')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup non-fat milk')),
                        ],
                      ),

                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup cottage cheese (1-percent fat)')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One fresh pineapple slice')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Four graham crackers')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Sparkling water with lemon or lime slice')),
                        ],
                      ),


                    ],
                  ),
                  /// dinner
                  ExpansionTile(
                    title:const Text(
                      'Dinner',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One serving lasagna')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Small garden salad with tomatoes and onions topped with one tablespoon salad dressing')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup non-fat milk')),
                        ],
                      ),


                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One apple')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup non-fat milk')),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
              /// Day 7
              ExpansionTile(
                title:   const Text(
                  'Day 7',
                  style: TextStyle(
                      fontFamily: 'Righteous', fontSize: 20),
                ),
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'By the end of today, you\'ll consume about 2,230 calories, with 54% of those calories coming from carbohydrates, 24% from fat, and 22% from protein. You\'ll also get about 27 grams of fiber.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  /// break fast
                  ExpansionTile(
                    title:const Text(
                      'Breakfast',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup whole wheat flakes with one cup non-fat milk and one teaspoon sugar')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One banana'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One slice whole-grain toast with one tablespoon peanut butter')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One cup of black coffee or herbal tea'),
                        ],
                      ),


                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('One cup grapes and one tangerine'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text('Glass of water, hot tea, or black coffee'),
                        ],
                      ),


                    ],
                  ),
                  /// lunch
                  ExpansionTile(
                    title:const Text(
                      'Lunch',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Tuna wrap with one wheat flour tortilla, one-half can water-packed tuna (drained), one tablespoon mayonnaise, lettuce, and sliced tomato')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One sliced avocado')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup non-fat milk')),
                        ],
                      ),

                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup cottage cheese (1-percent fat)')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One fresh pineapple slice')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Four graham crackers')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Sparkling water with lemon or lime slice')),
                        ],
                      ),


                    ],
                  ),
                  /// dinner
                  ExpansionTile(
                    title:const Text(
                      'Dinner',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One serving lasagna')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('Small garden salad with tomatoes and onions topped with one tablespoon salad dressing')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup non-fat milk')),
                        ],
                      ),


                    ],
                  ),
                  /// snack
                  ExpansionTile(
                    title:const Text(
                      'Snack',
                      style: TextStyle(
                          fontFamily: 'OleoScriptSwashCaps-Bold', fontSize: 20),
                    ),
                    children: [

                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One apple')),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            bullet,
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Expanded(child: Text('One cup non-fat milk')),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _fetch() {
    firestoreInstance.collection('fitness-zone').doc('diet').get().then((ds) {
      setState(() {
        dietImages = ds['images'];
      });
    });
  }
}

class MyBullet extends StatelessWidget {
  const MyBullet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
