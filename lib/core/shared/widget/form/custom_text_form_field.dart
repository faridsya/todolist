import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/extensions.dart';

class CustomTextFormField extends StatelessWidget {
  final bool? enabled;
  final bool readOnly; // = false;
  final bool autofocus; // = false;
  final bool obscureText; // = false;
  final int maxLines; // = 1;
  final int? minLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final String? prefixText;
  final String? hintText;
  final String? validateMessage;
  final String? initialValue;
  const CustomTextFormField(
      {Key? key,
      this.enabled,
      this.readOnly = false,
      this.autofocus = false,
      this.obscureText = false,
      this.maxLines = 1,
      this.minLines,
      this.maxLength,
      this.focusNode,
      this.controller,
      this.keyboardType,
      this.textInputAction,
      this.inputFormatters,
      this.onTap,
      this.onEditingComplete,
      this.onChanged,
      this.onFieldSubmitted,
      this.onSaved,
      this.validator,
      this.prefixIcon,
      this.prefixText,
      this.initialValue,
      this.hintText,
      this.validateMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          initialValue: initialValue,
          controller: controller,
          enabled: enabled,
          readOnly: readOnly,
          autofocus: autofocus,
          obscureText: obscureText,
          focusNode: focusNode,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          onTap: onTap,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          onEditingComplete: onEditingComplete,
          onSaved: onSaved,

          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            enabledBorder: _setBorder(),
            focusedBorder: _setBorder(),
            errorBorder: _setBorder(),
            prefixIcon: prefixIcon,
            prefixText: prefixText,

            hintText: hintText,
          ),
          style: context.text.labelLarge,
        ),
        if (validateMessage != null && validateMessage != '')
          Positioned.fill(
            left: 12,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                validateMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 11),
              ),
            ),
          ),
      ],
    );
  }

  Color _setBorderColor() {
    return validateMessage == ''
        ? Colors.green
        : validateMessage == null
            ? Colors.black12
            : Colors.red;
  }

  InputBorder _setBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: _setBorderColor(),
      ),
    );
  }
}
