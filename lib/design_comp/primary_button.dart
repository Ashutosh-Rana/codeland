import 'package:codeland/utils/app_colors.dart';
import 'package:codeland/utils/text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  PrimaryButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .07,
      width: MediaQuery.of(context).size.width * 0.9, // Width 90% of screen width
      child: Material(
        elevation: 8, // Elevation from below
        // shadowColor: AppColors.black, // Customize shadow color
        borderRadius: BorderRadius.circular(12.0), // Border radius 12
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor, // Primary color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Border radius 12
            ),
          ),
          child: Text(
            text,
            style: AppTextStyles.poppinsStyle24
          ),
        ),
      ),
    );
  }
}
