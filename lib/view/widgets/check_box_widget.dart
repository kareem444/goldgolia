import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:goldgolia_project/view/widgets/spacer_widget.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool value;
  final Function(bool?)? onChange;
  final String text;
  final Color? textColor;
  final double? textSize;
  final MainAxisAlignment? mainAxisAlignment;

  const CheckBoxWidget({
    Key? key,
    required this.value,
    this.onChange,
    required this.text,
    this.textColor,
    this.textSize,
    this.mainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          activeColor: Colors.yellow[800],
          onChanged: onChange,
        ),
        const SpacerWidget(
          width: .1,
        ),
        AutoSizeText(
          text,
          style: TextStyle(
            fontSize: textSize ?? 16,
            color: textColor ?? Colors.black,
          ),
          maxLines: 2,
        ),
      ],
    );
  }
}
