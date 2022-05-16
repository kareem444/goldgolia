import 'package:flutter/material.dart';
import 'package:goldgolia_project/controller/view/auth_view_provider.dart';
import 'package:goldgolia_project/helper/router_helper.dart';
import 'package:goldgolia_project/view/pages/auth/service/pick_talent_service.dart';
import 'package:goldgolia_project/view/pages/auth/widgets/auth_footer_widget.dart';
import 'package:goldgolia_project/view/pages/auth/widgets/auth_header/pick_talent_auth_header_widget.dart';
import 'package:goldgolia_project/view/pages/auth/widgets/control_buttons_widget.dart';
import 'package:goldgolia_project/view/widgets/check_box_widget.dart';
import 'package:goldgolia_project/view/widgets/create_page_widget.dart';
import 'package:goldgolia_project/view/widgets/spacer_widget.dart';
import 'package:provider/provider.dart';

class PickTalentsScreen extends StatelessWidget {
  const PickTalentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> talentsListItems = PickTalentService.talentsListItems;
    List<String> textSizeControlList = PickTalentService.textSizeControlList;

    return CreateScreenWidget(
      page: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const PickTalentAuthWidget(),
            Expanded(
              flex: 4,
              child: Builder(builder: (context) {
                AuthViewProvider authViewProvider =
                    context.watch<AuthViewProvider>();
                return GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 4,
                  children: [
                    for (var i = 0; i < talentsListItems.length; i++)
                      Padding(
                        padding: EdgeInsets.all(i % 2 != 0 ? 8.0 : 0),
                        child: Center(
                          child: CheckBoxWidget(
                            value: authViewProvider.talentsList
                                .contains(talentsListItems[i]),
                            text: talentsListItems[i],
                            textSize: textSizeControlList
                                    .contains(talentsListItems[i])
                                ? 14.5
                                : null,
                            textColor: authViewProvider.talentsList
                                    .contains(talentsListItems[i])
                                ? Colors.yellow[800]
                                : Colors.black54,
                            onChange: (bool? val) => context
                                .read<AuthViewProvider>()
                                .handleTalentsList(
                                  context,
                                  talentsListItems[i],
                                ),
                          ),
                        ),
                      ),
                  ],
                );
              }),
            ),
            const SpacerWidget(
              height: 15,
            ),
            Builder(
              builder: (context) {
                AuthViewProvider authViewProvider =
                    context.watch<AuthViewProvider>();
                return ControlButtonsWidget(
                  screen: authViewProvider.talentsList.isNotEmpty
                      ? RouterHelper.authPersionalInformationScreen
                      : null,
                  nextButtonColor: authViewProvider.talentsList.isEmpty
                      ? Colors.grey[600]
                      : null,
                );
              },
            ),
            const SpacerWidget(
              height: 15,
            ),
            const AuthFooterWidget(),
            const SpacerWidget(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
