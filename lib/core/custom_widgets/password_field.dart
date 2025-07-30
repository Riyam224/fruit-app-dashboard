// // todo _________

// import 'package:flutter/material.dart';
// import 'package:fruits/core/custom_widgets/custom_text_field.dart';

// class PasswordField extends StatefulWidget {
//   const PasswordField({super.key, this.onSaved, this.validator});
//   final void Function(String?)? onSaved;
//   final String? Function(String?)? validator;

//   @override
//   State<PasswordField> createState() => _PasswordFieldState();
// }

// class _PasswordFieldState extends State<PasswordField> {
//   bool obscureText = true;
//   @override
//   Widget build(BuildContext context) {
//     return CustomTextField(
//       obscureText: obscureText,
//       onSaved: onSaved, // ✅ Required
//       validator: validator,
//       suffixIcon: GestureDetector(
//         onTap: () {
//           setState(() {
//             obscureText = !obscureText;
//             setState(() {});
//           });
//         },
//         child: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
//       ),
//       keyboardType: TextInputType.visiblePassword,
//       hintText: 'Enter your Password',
//       suffix: Icon(Icons.visibility),
//     );
//   }
// }

// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordField extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const PasswordField({super.key, this.onSaved, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(hintText: 'Enter your password'),
      onSaved: onSaved, // ✅ Required
      validator: validator,
    );
  }
}
