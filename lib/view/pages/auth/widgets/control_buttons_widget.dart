import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:goldgolia_project/view/widgets/button_widget.dart';

class ControlButtonsWidget extends StatelessWidget {
  final String? screen;
  final bool signUp;
  final Color? nextButtonColor;
  final Function()? submit;

  const ControlButtonsWidget({
    Key? key,
    this.screen,
    this.signUp = false,
    this.nextButtonColor,
    this.submit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonWidget(
            text: "BACK",
            onPress: () => Get.back(),
            borderRaduis: 6,
            textSize: 20,
            buttonColor: Colors.yellow[700],
            textBold: true,
          ),
          ButtonWidget(
            text: signUp ? "SIGN UP" : "NEXT",
            onPress: () {
              if (!signUp && screen != null) {
                Get.toNamed(screen!);
              } else if (signUp) {
                submit!();
              }
            },
            borderRaduis: 6,
            textSize: 20,
            buttonColor: nextButtonColor ?? Colors.yellow[800],
            textBold: true,
          ),
        ],
      ),
    );
  }
}
