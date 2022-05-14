import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:goldgolia_project/view/widgets/check_box_widget.dart';

class CheckBoxContainerWidget extends StatelessWidget {
  final String text;
  final Color? borderColor;
  final bool showIcon;
  final IconData? iconData;
  final Color? iconColor;
  final bool checkBoxValue;
  final Function() onChange;
  final bool? showSubCheckBox;
  final List<Map<String, dynamic>>? subCheckBoxItems;

  const CheckBoxContainerWidget({
    Key? key,
    required this.text,
    this.borderColor,
    required this.showIcon,
    this.iconData,
    this.iconColor,
    required this.checkBoxValue,
    required this.onChange,
    this.showSubCheckBox,
    this.subCheckBoxItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? Colors.yellow[800]!),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            onTap: () => onChange(),
            leading: Checkbox(
              value: checkBoxValue,
              activeColor: Colors.yellow[800],
              onChanged: (bool? value) => onChange(),
            ),
            title: AutoSizeText(
              text,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black.withOpacity(checkBoxValue ? 1 : .6)),
              maxLines: 1,
            ),
            trailing: showIcon
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      iconData ?? Icons.keyboard_arrow_down_rounded,
                      color: iconColor ?? Colors.yellow[700],
                    ),
                  )
                : null,
          ),
          if (showSubCheckBox != null && showSubCheckBox == true)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var i = 0; i < subCheckBoxItems!.length; i++)
                  CheckBoxWidget(
                    value: subCheckBoxItems![i]['value'],
                    text: subCheckBoxItems![i]['title'],
                    onChange: subCheckBoxItems![i]['onChanged'],
                    textColor: Colors.black
                        .withOpacity(subCheckBoxItems![i]['value'] ? 1 : .6),
                  )
              ],
            )
        ],
      ),
    );
  }
}
