import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<String?> showConfirmDialog(BuildContext context, String dispMessage) async{
  AlertDialog dialog = AlertDialog(
    title: const Text('Confirm'),
    content: Text(dispMessage),
    actions: [
      ElevatedButton(
        onPressed: () => Navigator.of(context, rootNavigator: true).pop('cancel'),
        child: Text('Cancel'),
      ),
      ElevatedButton(
        onPressed: () => Navigator.of(context, rootNavigator: true).pop('ok'),
        child: Text('OK'),
      ),
    ],
  );
  String? res = await showDialog<String?>(
    barrierDismissible: false, // phai bam nut cancel hoac ok
    context: context,
    builder: (context) => dialog,
  );
  return res;
}

void showSnackBar(BuildContext context, String message, int second){
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), duration: Duration(seconds: second),)
  );
}