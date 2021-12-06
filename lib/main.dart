import 'package:flutter/material.dart';

void main() {
  runApp(const Menu());
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Menu Demo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              // Modify code here
              Example1(),
              Example2(),
              Example3(),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem(this.icon, this.itemText, {Key? key}) : super(key: key);
  final String icon;
  final String itemText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        icon,
        style: const TextStyle(
          fontSize: 30.0,
        ),
      ),
      title: Text(itemText),
    );
  }
}

// Problem 1: Overflow error
class Example1 extends StatelessWidget {
  const Example1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        children: const [
          // flex : 1 , This is similar to wrapping Text with Expanded.
          Expanded(
            child: Text(
              'Explore the restaurant\'s delicious menu items below!',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Problem 2: Viewport was given unbounded height error
class Example2 extends StatelessWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Remember from earlier that wrapping a widget with Expanded gives it a bounded constraint along the parent’s main axis
    //(width for Row, height for Column).
    // In this case, the parent is Column, so Expanded provides a height constraint. Wrap the ListView with Expanded,
    return Expanded(
      child: ListView(
        children: const [
          MenuItem('🍔', 'Burger'),
          MenuItem('🌭', 'Hot Dog'),
          MenuItem('🍟', 'Fries'),
          MenuItem('🥤', 'Soda'),
          MenuItem('🍦', 'Ice Cream'),
        ],
      ),
    );
  }
}

// Problem 3: Invisible VerticalDivider
class Example3 extends StatelessWidget {
  const Example3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              // ignore: avoid_print
              print('Pickup button pressed.');
            },
            child: const Text(
              'Pickup',
            ),
          ),
          // This widget is not shown on screen initially.
          const VerticalDivider(
            width: 20.0,
            thickness: 5.0,
          ),
          ElevatedButton(
            onPressed: () {
              // ignore: avoid_print
              print('Delivery button pressed.');
            },
            child: const Text(
              'Delivery',
            ),
          )
        ],
      ),
    );
  }
}
