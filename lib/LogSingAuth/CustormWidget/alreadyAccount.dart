import 'package:flutter/material.dart';

class AlreadyAccount extends StatelessWidget {
  final VoidCallback onTap;
  final String switchPage;
  final String comments;

  const AlreadyAccount({
    super.key,
    required this.onTap,
    required this.comments,
    required this.switchPage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(comments),
            //
            TextButton(
              onPressed: onTap,
              child: Text(
                switchPage,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
