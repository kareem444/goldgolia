import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldgolia_project/controller/view/auth_view_provider.dart';
import 'package:goldgolia_project/model/user/user_model.dart';
import 'package:goldgolia_project/service/user_service.dart';

import 'package:goldgolia_project/view/pages/auth/widgets/control_buttons_widget.dart';
import 'package:goldgolia_project/view/widgets/create_page_widget.dart';
import 'package:goldgolia_project/view/widgets/spacer_widget.dart';
import 'package:provider/provider.dart';

class PersionalInformationScreen extends StatelessWidget {
  const PersionalInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController mobileController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController genderController = TextEditingController();

    onSubmit() {
      if (fullNameController.text != "" &&
          emailController.text != "" &&
          passwordController.text != "" &&
          genderController.text != "") {
        UserService.signUpUser(
          context,
          UserModel(
            full_name: fullNameController.text,
            email: emailController.text,
            phone: mobileController.text,
            password: passwordController.text,
            gender: genderController.text,
            talents: context.read<AuthViewProvider>().talentsList.toString(),
          ).toMap(),
        );
      }
    }

    return CreateScreenWidget(
      page: ListView(
        children: [
          const SpacerWidget(
            height: 20,
          ),
          Center(
            child: AutoSizeText(
              "Personal inforamtion",
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
          InputField(
            textEditingController: fullNameController,
            text: "Full Name",
          ),
          InputField(
            textEditingController: emailController,
            text: "Email Adress",
          ),
          InputField(
            textEditingController: mobileController,
            text: "Mobile number",
          ),
          InputField(
            textEditingController: passwordController,
            text: "Password",
          ),
          InputField(
            textEditingController: genderController,
            text: "Gender",
          ),
          const SpacerWidget(
            height: 30,
          ),
          ControlButtonsWidget(
            signUp: true,
            submit: onSubmit,
          ),
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
            height: 15,
          ),
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.textEditingController,
    required this.text,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow[600]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow[600]!),
          ),
          hintText: text,
        ),
      ),
    );
  }
}
