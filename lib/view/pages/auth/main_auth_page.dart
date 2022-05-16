import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldgolia_project/view/pages/auth/widgets/auth_footer_widget.dart';
import 'package:goldgolia_project/view/pages/auth/widgets/auth_header/main_auth_header_widget.dart';
import 'package:goldgolia_project/view/widgets/button_widget.dart';
import 'package:goldgolia_project/view/widgets/create_page_widget.dart';
import 'package:goldgolia_project/view/widgets/divider_widget.dart';
import 'package:goldgolia_project/view/widgets/spacer_widget.dart';

class MainAuthPage extends StatelessWidget {
  const MainAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreateScreenWidget(
      page: ListView(
        children: [
          const MainAuthHeaderWidget(),
          ButtonWidget(
            text: "Sign up with Email",
            buttonWidth: 1.1,
            borderRaduis: 2,
            transparent: true,
            textColor: Colors.black,
            borderColor: Colors.grey[300],
            buttonBadding: 10,
            textSize: 18,
            onPress: () {},
          ),
          const SpacerWidget(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DividerWidget(
                width: 2.5,
              ),
              Text(
                " OR ",
                style: TextStyle(fontSize: Get.width / 23),
              ),
              const DividerWidget(
                width: 2.5,
              ),
            ],
          ),
          const SpacerWidget(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonWidget(
                text: "Sign up with Google",
                buttonWidth: 2.3,
                borderRaduis: 2,
                image: "assets/images/logo.png",
                transparent: true,
                iconColor: Colors.blue[900],
                textColor: Colors.black,
                borderColor: Colors.grey[400],
                borderWidth: 1,
                buttonBadding: 8,
                textSize: 18,
                onPress: () {},
              ),
              ButtonWidget(
                text: "Sign up with Facebook",
                buttonWidth: 2.3,
                borderRaduis: 2,
                icon: Icons.facebook_rounded,
                iconColor: Colors.blue[800],
                transparent: true,
                textColor: Colors.black,
                borderColor: Colors.grey[400],
                buttonBadding: 8,
                borderWidth: 1,
                textSize: 18,
                onPress: () {},
              ),
            ],
          ),
          const SpacerWidget(
            height: 60,
          ),
          const AuthFooterWidget(
            signup: true,
          )
        ],
      ),
    );
  }
}
