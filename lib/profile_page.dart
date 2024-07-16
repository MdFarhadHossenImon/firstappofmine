import 'package:flutter/cupertino.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Profile'),
        leading: Icon(CupertinoIcons.app),
      ),
      // child: Column(
      //   children: [
      //     Text(
      //       'This is cupertino design system',
      //       style: TextStyle(color: Colors.green),
      //     ),
      //   ],
      // ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello World'),
            SizedBox(height: 16),
            Icon(CupertinoIcons.add, size: 45,),
            SizedBox(height: 16),
            CupertinoButton.filled(child: Text('Click'), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}