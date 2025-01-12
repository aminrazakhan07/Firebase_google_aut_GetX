import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController textController;
  final String lblText;
  final String hint;
  final IconData? prefix;
  final bool obscur;
  const CustomTextfield({
    super.key,
    required this.textController,
    required this.lblText,
    required this.hint,
    this.prefix,
    this.obscur = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 20, right: 20),
        child: TextField(
          controller: textController,
          obscureText: obscur,
          autofocus: true,
          autocorrect: true,
          decoration: InputDecoration(
            label: Text(lblText),
            labelStyle: TextStyle(color: Colors.pinkAccent),
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.blueGrey[200],
            ),
            prefixIcon: Icon(prefix),
            prefixIconColor: Colors.pinkAccent[100],
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 229, 250),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pinkAccent),
              // borderRadius: BorderRadius.only(
              // topLeft: Radius.circular(25),
              // bottomRight: Radius.circular(25),
              // ),
            ),
            //
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pinkAccent),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomRight: Radius.circular(0),
              ),
            ),
            //
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.pinkAccent),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          ),
        ),
      ),
    );
  }
}
