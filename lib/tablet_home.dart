import 'package:flutter/material.dart';

class TabletHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HUMMING\nBIRD.'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Episodes',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'About',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'FLUTTER WEB. THE BASICS',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'In this course we will go over the basics of using\n'
                  'Flutter Web for development. Topics will include\n'
                  'Responsive Layout, Deploying, Font Changes, Hover\n'
                  'functionality, Modals and more.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Text(
                'Join course',
                style: TextStyle(
                  color: Colors.white,
                    fontSize: 20// Set text color to white
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                backgroundColor: Colors.green, // Set button background color to green
              ),
            ),

          ],
        ),
      ),
    );
  }
}
