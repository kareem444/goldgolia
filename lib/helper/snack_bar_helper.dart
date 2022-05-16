import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SnackBarHelper {
  static snakeBar({
    required BuildContext context,
    required String text,
    Color? color,
  }) {
    SnackBar snackBar = SnackBar(
      content: AutoSizeText(
        text,
        style: const TextStyle(fontSize: 18),
        maxLines: 1,
      ),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
