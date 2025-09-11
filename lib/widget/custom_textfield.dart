import 'package:flutter/material.dart';
import 'package:myfinance/styles.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.label,
    required this.hint,
    this.hasSuffixIcon = false,
    this.onPressed,
    this.isObscure = false,
    this.prefixIcon,
  });

  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String label;
  final String hint;
  final bool hasSuffixIcon;
  final VoidCallback? onPressed;
  final bool isObscure;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      cursorColor: Color.fromARGB(255, 255, 255, 255),
      keyboardType: textInputType,
      textInputAction: textInputAction,
      obscureText: isObscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 24, 24, 32),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Colors.white70)
            : null,
        suffixIcon: hasSuffixIcon
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.outlineElement,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.outlineElement,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(color: Color.fromARGB(200, 255, 255, 255)),
        hintStyle: const TextStyle(color: Color.fromARGB(160, 255, 255, 255)),
      ),
    );
  }
}
