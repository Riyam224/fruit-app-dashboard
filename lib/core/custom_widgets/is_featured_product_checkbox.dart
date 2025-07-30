import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_dashboard/core/custom_widgets/custom_check_box.dart';
import 'package:fruit_dashboard/core/utils/app_text_styles.dart';

class IsFeaturedProduct extends StatefulWidget {
  const IsFeaturedProduct({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<IsFeaturedProduct> createState() => _IsFeaturedProductState();
}

class _IsFeaturedProductState extends State<IsFeaturedProduct> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'is a featured product',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
