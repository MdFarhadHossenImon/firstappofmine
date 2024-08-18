import 'package:flutter/material.dart';
import 'desktop_view.dart';
import 'mobile_view.dart';
import 'tablet_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Flutter UI',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1024) {
            // Desktop view
            return DesktopHome();
          } else if (constraints.maxWidth > 600 && constraints.maxWidth <= 1024) {
            // Tablet view
            return TabletHome();
          } else {
            // Mobile view
            return MobileHome();
          }
        },
      ),
    );
  }
}

