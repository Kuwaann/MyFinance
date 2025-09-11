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
  });

  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String label;
  final String hint;
  final bool hasSuffixIcon;
  final VoidCallback? onPressed;
  final bool isObscure;
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: AppColors.outlineElement),
      keyboardType: textInputType,
      textInputAction: textInputAction,
      obscureText: isObscure,
      decoration: InputDecoration(
        suffixIcon: hasSuffixIcon ? IconButton(
          onPressed: onPressed, 
          icon: Icon(
            isObscure ? Icons.visibility : Icons.visibility_off)) : null,
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
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(color: AppColors.outlineElement),
        hintStyle: TextStyle(color: AppColors.outlineElement),
      ),
    );
  }
}
