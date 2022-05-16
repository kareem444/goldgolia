import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:goldgolia_project/controller/view/auth_view_provider.dart';
import 'package:goldgolia_project/view/widgets/spacer_widget.dart';
import 'package:provider/provider.dart';

class PickTalentAuthWidget extends StatelessWidget {
  const PickTalentAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SpacerWidget(
          height: 20,
        ),
        Center(
          child: AutoSizeText(
            "What talents do you have ?",
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
        Builder(builder: (context) {
          int talentsListLength =
              context.watch<AuthViewProvider>().talentsList.length;
          return Center(
            child: AutoSizeText(
              "Maximum of 3 talents can be selected",
              style: TextStyle(
                fontSize: Get.width / 25,
                color: talentsListLength >= 3 ? Colors.red : Colors.black,
              ),
              maxLines: 1,
            ),
          );
        }),
        const SpacerWidget(
          height: 20,
        ),
      ],
    );
  }
}
