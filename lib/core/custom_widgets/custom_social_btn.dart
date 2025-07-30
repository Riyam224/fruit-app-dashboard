import 'package:flutter/material.dart';

class CustomSocialBtn extends StatelessWidget {
  const CustomSocialBtn({
    super.key,
    required this.text,
    required this.image,
    this.onTap,
    required this.color,
  });
  final String text;
  final String image;
  final Function()? onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: const Color(0xFFDCDEDE)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          children: [
            Container(width: 100),
            SizedBox(width: 15),
            SizedBox(
              width: 150,
              child: Text(
                text,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
                  fontSize: 16,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  height: 1.40,
                ),
              ),
            ),
            SizedBox(width: 40),
            Image.asset(image, width: 24),
          ],
        ),
      ),
    );
  }
}
