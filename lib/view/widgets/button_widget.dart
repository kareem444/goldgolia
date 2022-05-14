import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:goldgolia_project/view/widgets/spacer_widget.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double? textSize;
  final Color? textColor;
  final double? borderRaduis;
  final Color? borderColor;
  final double? buttonWidth;
  final double? borderWidth;
  final double? buttonBadding;
  final Color? buttonColor;
  final Function() onPress;
  final bool? transparent;
  final IconData? icon;
  final Color? iconColor;
  final String? image;
  final double? imageHeight;
  final bool textBold;

  const ButtonWidget({
    Key? key,
    required this.text,
    this.textSize,
    this.textColor,
    this.borderRaduis,
    this.borderColor,
    this.buttonWidth,
    this.borderWidth,
    this.buttonBadding,
    this.buttonColor,
    required this.onPress,
    this.transparent,
    this.icon,
    this.iconColor,
    this.image,
    this.imageHeight,
    this.textBold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.all(buttonBadding ?? 16),
          width: Get.width / (buttonWidth ?? 3),
          decoration: BoxDecoration(
            boxShadow: [
              if (transparent == null)
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
            ],
            color: transparent == null
                ? buttonColor ??
                    (context.isDarkMode ? Colors.teal[600] : Colors.blue)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(borderRaduis ?? 100),
            border: transparent != null
                ? Border.all(
                    color: borderColor ??
                        (context.isDarkMode
                            ? Colors.teal[700]!
                            : Colors.blueGrey[600]!),
                    width: borderWidth ?? 2,
                  )
                : null,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (image != null) ...{
                  Image.asset(
                    image!,
                    height: imageHeight ?? 30,
                  ),
                  const SpacerWidget(
                    width: 4,
                  ),
                },
                if (icon != null) ...{
                  Icon(
                    icon,
                    color: iconColor ?? textColor,
                    size: 30,
                  ),
                  const SpacerWidget(
                    width: 4,
                  ),
                },
                Flexible(
                  child: AutoSizeText(
                    text,
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: textSize,
                      fontWeight: textBold ? FontWeight.bold : null,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
