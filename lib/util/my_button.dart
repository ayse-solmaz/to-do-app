
import 'package:flutter/material.dart';
import 'package:to_do_app/util/app_style.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  /// Navy kutu icinde dolgulu beyaz buton mu, yoksa sadece cerceveli mi cizilecek.
  final bool filled;

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(14);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: filled ? Colors.white : Colors.transparent,
        borderRadius: borderRadius,
        border: Border.all(
          color: filled ? Colors.white : whiteAlpha(0.35),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius,
          splashColor: filled ? navyAlpha(0.14) : whiteAlpha(0.14),
          highlightColor: filled ? navyAlpha(0.08) : whiteAlpha(0.08),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
            child: Text(
              text,
              style: TextStyle(
                color: filled ? kNavy : Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
