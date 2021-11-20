import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class PageHelper {
  static Future<bool?> showOkAlertDialog({
    required BuildContext context,
    required String alertDialogTitle,
    String? alertDialogMessage,
    Widget? alertDialogWidget,
    Widget? destinationPage,
  }) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            alertDialogTitle,
            style: TextStyle(color: Colors.black),
          ),
          content: (alertDialogMessage != null)
              ? Text(
            alertDialogMessage,
            style: TextStyle(
              color: Colors.black,
            ),
          )
              : alertDialogWidget,
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                if (destinationPage != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => destinationPage),
                  );
                } else {
                  Navigator.of(context).pop(false);
                }
              },
            ),
          ],
        );
      },
    );
  }
  static void showSnackbar(BuildContext context,String value){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}