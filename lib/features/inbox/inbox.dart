import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConst.primaryColor,
      body: Center(child: Text('Inbox', style: TextStyle(color: Colors.white))),
    );
  }
}
