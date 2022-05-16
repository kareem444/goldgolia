import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldgolia_project/view/widgets/spacer_widget.dart';

class PersonalInforamtionAuthHeaderWidget extends StatelessWidget {
  const PersonalInforamtionAuthHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SpacerWidget(
          height: 20,
        ),
        Center(
          child: AutoSizeText(
            "Personal inforamtion",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Get.width / 14,
            ),
            maxLines: 1,
          ),
        ),
        const SpacerWidget(
          height: 20,
        ),
      ],
    );
  }
}
