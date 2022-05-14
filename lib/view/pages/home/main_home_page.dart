import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldgolia_project/view/widgets/create_page_widget.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = Get.arguments[0];
    return CreateScreenWidget(
      page: Center(
        child: Text(value.toString()),
      ),
    );
  }
}
