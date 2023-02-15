// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quize_app/models/question_list.dart';
import 'package:quize_app/res/constants/widget_styles.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final String? errorText;
  final String? suffixText;
  final IconData? suffixIcon;
  final String? prefixText;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final VoidCallback? onPrefixIconPressed;
  final TextEditingController controller;
  final bool obscure;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? onChanged;
  final int maxLines;
  final int? minLines;
  final bool enabled;
  final double height;
  final double width;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.hintText,
    this.errorText,
    this.suffixText,
    this.suffixIcon,
    this.prefixText,
    this.prefixIcon,
    this.prefixIconColor,
    this.onPrefixIconPressed,
    required this.controller,
    this.obscure = false,
    required this.keyboardType,
    required this.textInputAction,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.maxLines = 1,
    this.minLines,
    this.enabled = true,
    this.height = 40,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: WidgetStyle.primaryColor.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: TextFormField(
            controller: controller,
            obscureText: obscure,
            keyboardType: keyboardType,
            validator: validator,
            onSaved: onSaved,
            onChanged: onChanged,
            maxLines: maxLines,
            minLines: minLines,
            enabled: enabled,
            textInputAction: textInputAction,
            style: WidgetStyle.customTextFieldStyle,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              errorText: errorText,
              suffixText: suffixText,
              suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
              prefixText: prefixText,
              prefixIcon: InkWell(
                onTap: onPrefixIconPressed,
                child: Icon(
                  prefixIcon,
                  color: prefixIconColor,
                ),
              ),
              labelStyle: WidgetStyle.customTextFieldLabelStyle,
              hintStyle: WidgetStyle.customTextFieldHintStyle,
              errorStyle: WidgetStyle.customTextFieldErrorStyle,
              suffixStyle: WidgetStyle.customTextFieldSuffixStyle,
              prefixStyle: WidgetStyle.customTextFieldPrefixStyle,
              border: WidgetStyle.customTextFieldBorder,
              enabledBorder: WidgetStyle.customTextFieldEnabledBorder,
              focusedBorder: WidgetStyle.customTextFieldFocusedBorder,
              errorBorder: WidgetStyle.customTextFieldErrorBorder,
              focusedErrorBorder: WidgetStyle.customTextFieldFocusedErrorBorder,
              disabledBorder: WidgetStyle.customTextFieldDisabledBorder,
            ),
          ),
        ),
      ),
    );
  }
}
