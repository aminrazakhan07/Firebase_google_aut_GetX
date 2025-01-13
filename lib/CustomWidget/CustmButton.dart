// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class CustmButton extends StatelessWidget {
  final String btnText;
  const CustmButton({
    super.key,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          btnText,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            Colors.pinkAccent[200],
          ),
        ),
      ),
    );
  }
}
