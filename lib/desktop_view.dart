
import 'package:flutter/material.dart';

class DesktopHome extends StatelessWidget {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'FLUTTER WEB. THE BASICS',
                style: TextStyle(
                    fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                'In this course we will go over the basics of using Flutter Web for development. '
                    'Topics will include Responsive Layout, Deploying, Font Changes, Hover functionality, '
                    'Modals and more.',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 32.0),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Join course',
                  style: TextStyle(
                    color: Colors.white,
                      fontSize: 21// Set text color to white
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
      ),
    );
  }
}
