import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldgolia_project/controller/view/auth_view_provider.dart';
import 'package:goldgolia_project/model/user/user_model.dart';
import 'package:goldgolia_project/service/user_service.dart';
import 'package:goldgolia_project/view/pages/auth/widgets/auth_header/personal_information_auth_header_widget.dart';
import 'package:goldgolia_project/view/pages/auth/widgets/control_buttons_widget.dart';
import 'package:goldgolia_project/view/pages/auth/widgets/auth_footer_widget.dart';
import 'package:goldgolia_project/view/widgets/create_page_widget.dart';
import 'package:goldgolia_project/view/widgets/input_field_widget.dart';
import 'package:goldgolia_project/view/widgets/spacer_widget.dart';
import 'package:provider/provider.dart';

class PersionalInformationScreen extends StatelessWidget {
  PersionalInformationScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController mobileController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController genderController = TextEditingController();

    onSubmit() {
      if (_formKey.currentState!.validate()) {
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
        page: Form(
      key: _formKey,
      child: ListView(
        children: [
          const PersonalInforamtionAuthHeaderWidget(),
          InputField(
            textEditingController: fullNameController,
            text: "Full Name",
          ),
          InputField(
            textEditingController: emailController,
            text: "Email Adress",
            email: true,
          ),
          InputField(
            textEditingController: mobileController,
            text: "Mobile number",
            mobile: true,
          ),
          InputField(
            textEditingController: passwordController,
            text: "Password",
            password: true,
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
          const AuthFooterWidget(),
          const SpacerWidget(
            height: 15,
          ),
        ],
      ),
    ));
  }
}
