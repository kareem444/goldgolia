import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:goldgolia_project/controller/view/control_app_view_provider.dart';
import 'package:goldgolia_project/helper/router_helper.dart';
import 'package:goldgolia_project/model/user/user_repo.dart';
import 'package:provider/provider.dart';

class UserService {
  static signUpUser(BuildContext context, Map<String, dynamic> data) {
    FocusManager.instance.primaryFocus?.unfocus();
    context.read<ControlAppViewProvider>().handelLoadingScreen(true);
    UserRepo.signUpUser(data).then((value) {
      context.read<ControlAppViewProvider>().handelLoadingScreen(false);
      Get.toNamed(RouterHelper.homePage, arguments: [value]);
    });
  }
}
