import 'package:codeland/utils/text_styles.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color btnColor;

  SecondaryButton({
    required this.onPressed,
    required this.text,
    required this.textColor,
    required this.btnColor
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.33,
      height: 38,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(12),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: btnColor, // Change this color to your tertiaryColor
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: AppTextStyles.poppinsStyle14.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
