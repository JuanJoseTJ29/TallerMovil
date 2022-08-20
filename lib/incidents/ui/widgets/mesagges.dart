import 'package:flutter/material.dart';

class SnackBarCustomerPick {
  static SnackBar showSnackBarFail(
      {required BuildContext context, required String message}) {
    return SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
  }
}
