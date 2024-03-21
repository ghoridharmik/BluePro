import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final Color? btnColor;
  final Color? textColor;
  final String? text;
  final double? height;
  final double? width;
  final void Function()? onTap;
  const CommonButton({
    super.key,
    this.onTap,
    this.btnColor,
    this.text,
    this.height,
    this.width,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: btnColor,
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: textColor),
          ),
        ),
      ),
    );
  }
}
