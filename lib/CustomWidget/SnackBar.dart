import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static void showSnackbar({
    required String title,
    required String message,
    SnackPosition? position,
    IconData? icon,
    Color backgroundColor = const Color.fromARGB(255, 255, 229, 250),
    Color textColor = Colors.pinkAccent,
    Duration duration = const Duration(seconds: 1),
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: position,
      backgroundColor: backgroundColor,
      colorText: textColor,
      borderRadius: 8,
      margin: const EdgeInsets.all(10),
      duration: duration,
      icon: icon != null ? Icon(icon, color: textColor) : null,
    );
  }
}
