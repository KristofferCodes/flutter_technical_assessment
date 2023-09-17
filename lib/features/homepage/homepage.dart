import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConst.primaryColor,
      body: Center(child: Text('Home', style: TextStyle(color: Colors.white))),
    );
  }
}
