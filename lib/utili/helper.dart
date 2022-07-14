import 'package:flutter/material.dart';

mixin Helper {
  showSnackBar(
    BuildContext context, {
    required String message,
    required bool error,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: Text(message),
        elevation: 0,
        backgroundColor: error?Colors.red:Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }
}
