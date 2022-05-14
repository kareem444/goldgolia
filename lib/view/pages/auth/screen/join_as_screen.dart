import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldgolia_project/controller/view/auth_view_provider.dart';
import 'package:goldgolia_project/helper/router_helper.dart';
import 'package:goldgolia_project/util/constants.dart';
import 'package:goldgolia_project/view/pages/auth/widgets/check_box_container_widget.dart';
import 'package:goldgolia_project/view/pages/auth/widgets/control_buttons_widget.dart';
import 'package:goldgolia_project/view/widgets/create_page_widget.dart';
import 'package:goldgolia_project/view/widgets/spacer_widget.dart';
import 'package:provider/provider.dart';

class JoinAsScreen extends StatelessWidget {
  const JoinAsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreateScreenWidget(
      page: ListView(
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
          Builder(builder: (context) {
            AuthViewProvider authViewProvider =
                context.watch<AuthViewProvider>();
            return Column(
              children: [
                CheckBoxContainerWidget(
                  text: "Talent",
                  showIcon: false,
                  checkBoxValue: authViewProvider.joinAsTalent,
                  onChange: () =>
                      context.read<AuthViewProvider>().handelJoinAsTalent(),
                ),
                const SpacerWidget(
                  height: 30,
                ),
                CheckBoxContainerWidget(
                  text: "Employer",
                  showIcon: true,
                  checkBoxValue: authViewProvider.joinAsEmployer,
                  onChange: () =>
                      context.read<AuthViewProvider>().handelJoinAsEmployer(),
                  showSubCheckBox: authViewProvider.joinAsEmployer,
                  subCheckBoxItems: [
                    {
                      "title": "Indvidual",
                      "value": authViewProvider.employerIndvidual,
                      "onChanged": (bool? val) => context
                          .read<AuthViewProvider>()
                          .handleEmployerIndvidual()
                    },
                    {
                      "title": "Corporate",
                      "value": authViewProvider.employerCorporate,
                      "onChanged": (bool? val) => context
                          .read<AuthViewProvider>()
                          .handleEmployerCorporate()
                    },
                  ],
                ),
              ],
            );
          }),
          const SpacerWidget(
            height: 40,
          ),
          Builder(builder: (context) {
            AuthViewProvider authViewProvider =
                context.watch<AuthViewProvider>();
            return ControlButtonsWidget(
              screen: authViewProvider.joinAsTalent
                  ? RouterHelper.authPickTalentsScreen
                  : RouterHelper.authPersionalInformationScreen,
            );
          }),
          const SpacerWidget(
            height: 40,
          ),
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Already a member? ",
                    style: TextStyle(fontSize: Get.width / 22),
                  ),
                  WidgetSpan(
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        fontSize: Get.width / 23,
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
        ],
      ),
    );
  }
}
