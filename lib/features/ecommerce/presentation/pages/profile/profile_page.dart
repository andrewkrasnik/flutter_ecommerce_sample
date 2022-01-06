import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: Center(
        child: Text(
          "Profile page",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
