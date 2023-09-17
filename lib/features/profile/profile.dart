import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConst.primaryColor,
      body: Center(
          child: Text(
        'profile',
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
