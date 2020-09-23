import 'package:flutter/material.dart';

class SnackBarWidget extends StatelessWidget {

  final String text;

  const SnackBarWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(text),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
      ),
    );
  }
}
