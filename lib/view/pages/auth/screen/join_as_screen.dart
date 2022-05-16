import 'package:flutter/material.dart';
import 'package:goldgolia_project/controller/view/auth_view_provider.dart';
import 'package:goldgolia_project/helper/router_helper.dart';
import 'package:goldgolia_project/view/pages/auth/widgets/auth_header/join_as_auth_header_widget.dart';
import 'package:goldgolia_project/view/pages/auth/widgets/check_box_container_widget.dart';
import 'package:goldgolia_project/view/pages/auth/widgets/control_buttons_widget.dart';
import 'package:goldgolia_project/view/pages/auth/widgets/auth_footer_widget.dart';
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
          const JoinAsAuthHeaderWidget(),
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
          const AuthFooterWidget(),
          const SpacerWidget(
            height: 40,
          ),
        ],
      ),
    );
  }
}
