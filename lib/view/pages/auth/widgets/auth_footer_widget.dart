import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldgolia_project/helper/router_helper.dart';

class AuthFooterWidget extends StatelessWidget {
  final bool signup;
  const AuthFooterWidget({
    Key? key,
    this.signup = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return signup
        ? Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account ? ",
                    style: TextStyle(fontSize: Get.width / 22),
                  ),
                  textButtonSpan(
                    "Sign up",
                    () => Get.toNamed(RouterHelper.authjoinAsScreen),
                  )
                ],
              ),
            ),
          )
        : Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Already a member? ",
                    style: TextStyle(fontSize: Get.width / 22),
                  ),
                  textButtonSpan(
                    "Log in",
                    () {},
                  )
                ],
              ),
            ),
          );
  }

  WidgetSpan textButtonSpan(String text, Function()? onPressed) {
    return WidgetSpan(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.bottomCenter,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: Get.width / 23,
            color: Colors.yellow[700],
          ),
        ),
      ),
    );
  }
}
