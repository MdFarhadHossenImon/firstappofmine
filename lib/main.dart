

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(IntroApp());
}

class IntroApp extends StatelessWidget {
  const IntroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intro App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/settings': (context) => const Settings(),
        '/ThreeDotIcon': (context) => const ThreeDoticon()
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Hubs'),
        titleSpacing: 10,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 1,
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: const Icon(Icons.settings),
          ),
          IconButton(onPressed: () {
            Navigator.pushNamed(context, '/ThreeDotIcon');
          }, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(

        children: [
          Column(
            children: [
              Text('Discount Product'),
              Text('Product with review'),
              Text('Custom Product'),
              Text('Feature Product')

            ],

          )
        ],

      ),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        titleSpacing: 10,
        toolbarHeight: 60,
        backgroundColor: Colors.cyan,
      ),
      body: const Center(
        child: Text('Settings'),
      ),
    );
  }
}
class ThreeDoticon extends StatelessWidget {
  const ThreeDoticon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        titleSpacing: 10,
        toolbarHeight: 60,
        backgroundColor: Colors.cyan,
      ),
      body: const Center(
        child: Text('Menu'),
      ),
    );
  }
}

