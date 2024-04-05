import 'package:codeland/utils/app_colors.dart';
import 'package:codeland/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String? val)? validator;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;

  CustomTextField({
    required this.controller,
    required this.hintText,
    required this.validator,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      // height: MediaQuery.of(context).size.height * .07,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        onChanged: widget.onChanged,
        validator: widget.validator,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          hintText: widget.hintText,
          // isDense: true,
          hintStyle: AppTextStyles.poppinsStyle16,
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon)
              : null,
          // filled: true,
          // fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: AppColors.darkGrey),
          ),
          // contentPadding: EdgeInsets.symmetric(
          //   vertical: 10.0,
          //   horizontal: 20.0,
          // ),
        ),
      ),
    );
  }
}
