import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Styling App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Styling App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Title Text
              Text(
                'Flutter Text Styling',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10), // Space between title and subtitle

              // Subtitle Text
              Text(
                'Experiment with text styles',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), // Space between subtitle and button

              // Interactive Text Button
              TextButton(
                onPressed: () {
                  // Display a SnackBar
                  final snackBar = SnackBar(
                    content: Text('You clicked the button!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text(
                  'Click Me',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(height: 10), // Space between button and the welcome text

              // Welcome Text
              Text.rich(
                TextSpan(
                  text: 'Welcome to ',
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Flutter!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
