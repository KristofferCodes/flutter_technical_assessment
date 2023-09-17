import 'package:flutter/material.dart';
import 'package:flutter_technical_assessment/utils/constants.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConst.primaryColor,
      body: Center(
          child: Text('Add Page', style: TextStyle(color: Colors.white))),
    );
  }
}
