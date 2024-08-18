import 'package:flutter/material.dart';

class MobileHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HUMMING BIRD .'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'SKILL UP NOW\nTAP HERE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.black), // Ensure icon is visible
              title: Text('Episodes'),
              onTap: () {
                // Handle episode navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.black), // Ensure icon is visible
              title: Text('About'),
              onTap: () {
                // Handle about navigation
              },
            )
          ],
        ),
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
                    fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                'In this course we will go over the basics of using Flutter Web for development. '
                    'Topics will include Responsive Layout, Deploying, Font Changes, Hover functionality, '
                    'Modals and more.',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 32.0),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Join course',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                    // Set text color to white
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
