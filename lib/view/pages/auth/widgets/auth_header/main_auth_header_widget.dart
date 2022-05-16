import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldgolia_project/util/constants.dart';
import 'package:goldgolia_project/view/widgets/spacer_widget.dart';

class MainAuthHeaderWidget extends StatelessWidget {
  const MainAuthHeaderWidget({Key? key}) : super(key: key);

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
            "Welcome Back!",
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
          child: AutoSizeText(
            "Let's Share your talent with the world",
            style: TextStyle(fontSize: Get.width / 20, color: Colors.black54),
            maxLines: 1,
          ),
        ),
        const SpacerWidget(
          height: 60,
        ),
      ],
    );
  }
}
