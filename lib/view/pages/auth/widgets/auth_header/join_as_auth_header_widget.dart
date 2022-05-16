import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:goldgolia_project/util/constants.dart';
import 'package:goldgolia_project/view/widgets/spacer_widget.dart';

class JoinAsAuthHeaderWidget extends StatelessWidget {
  const JoinAsAuthHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SpacerWidget(
          height: 20,
        ),
        Image.asset(
          Constants.imageLogo,
          height: Get.width / 3,
        ),
        const SpacerWidget(
          height: 20,
        ),
        Center(
          child: AutoSizeText(
            "Welcome!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Get.width / 13,
            ),
          ),
        ),
        const SpacerWidget(
          height: 20,
        ),
        Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "You're itn the right place ",
                  style: TextStyle(fontSize: Get.width / 22),
                ),
                WidgetSpan(
                  child: Text(
                    "JOIN US",
                    style: TextStyle(
                      fontSize: Get.width / 24,
                      color: Colors.yellow[700],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SpacerWidget(
          height: 40,
        ),
        Center(
          child: AutoSizeText(
            "Join as",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Get.width / 13,
            ),
          ),
        ),
        const SpacerWidget(
          height: 40,
        ),
      ],
    );
  }
}
