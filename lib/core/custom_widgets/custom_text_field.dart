// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   const CustomTextField({
//     super.key,
//     this.suffix,
//     this.hintText,
//     this.keyboardType,
//     this.onSaved,
//     this.obscureText = false,
//     this.suffixIcon,
//   });
//   final Widget? suffix;
//   final String? hintText;
//   final TextInputType? keyboardType;
//   final void Function(String?)? onSaved;
//   final bool obscureText;
//   final Widget? suffixIcon;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: obscureText,
//       onSaved: onSaved,
//       validator: (value) {
//         if (value == null || value.isEmpty) return 'Field required';
//         return null;
//       },

//       keyboardType: keyboardType,
//       cursorColor: Colors.black,
//       cursorHeight: 20,
//       cursorWidth: 1,
//       cursorRadius: const Radius.circular(10),
//       style: const TextStyle(color: Colors.black),
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//         suffix: suffix,
//         suffixIcon: suffixIcon,
//         suffixIconColor: Color(0xff949D9E),
//         suffixStyle: const TextStyle(color: Colors.black),
//         hintText: hintText,
//         hintStyle: const TextStyle(color: Color(0xff949D9E)),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.maxLines,
  });
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: textInputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: TextStyles.bold13.copyWith(color: const Color(0xFF949D9E)),
        hintText: hintText,
        filled: true,

        fillColor: const Color(0xFFF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(width: 1, color: Color(0xFFE6E9E9)),
    );
  }
}
