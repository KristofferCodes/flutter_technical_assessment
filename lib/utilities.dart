import 'package:flutter/material.dart';

void successSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
      ),
      backgroundColor: Colors.green,
    ),
  );
}

void failureSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
      ),
      backgroundColor: Colors.red,
    ),
  );
}
