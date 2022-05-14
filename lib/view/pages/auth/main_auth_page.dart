import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldgolia_project/helper/router_helper.dart';
import 'package:goldgolia_project/util/constants.dart';
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
          ButtonWidget(
            text: "Sign up with Email",
            buttonWidth: 1.1,
            borderRaduis: 2,
            transparent: true,
            textColor: Colors.black,
            borderColor: Colors.grey[300],
            buttonBadding: 10,
            textSize: 18,
            onPress: () => Get.toNamed(RouterHelper.authjoinAsScreen),
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
                style: TextStyle(fontSize: Get.width / 20),
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
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account ? ",
                    style: TextStyle(fontSize: Get.width / 22),
                  ),
                  WidgetSpan(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: Get.width / 23,
                        color: Colors.yellow[700],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
