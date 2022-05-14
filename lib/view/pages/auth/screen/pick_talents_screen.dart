import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldgolia_project/controller/view/auth_view_provider.dart';
import 'package:goldgolia_project/helper/router_helper.dart';
import 'package:goldgolia_project/view/pages/auth/service/pick_talent_service.dart';
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
            Column(
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
                Center(
                  child: AutoSizeText(
                    "Maximum of 3 talents can be selected",
                    style: TextStyle(
                      fontSize: Get.width / 25,
                    ),
                    maxLines: 1,
                  ),
                ),
                const SpacerWidget(
                  height: 20,
                ),
              ],
            ),
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
                                .handleTalentsList(talentsListItems[i]),
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
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
