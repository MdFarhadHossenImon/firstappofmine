import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Greeting App',
    home: Scaffold(
      appBar: AppBar(
        title: Text('Greeting App'),
      ),
      body: Center(
        child: MyHomePage(),),
    ),
  );
}
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Hello, World!',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        Text('Welcome to Flutter!'),
        Image.asset('Assets/icons/Logo.jpg'),
    ElevatedButton(
          onPressed: () {
            final snackBar = SnackBar(content: Text('Button Pressed!'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text('Press Me'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
        ),
      ],
    );
  }
}