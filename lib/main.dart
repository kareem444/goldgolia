import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:goldgolia_project/controller/view/auth_view_provider.dart';
import 'package:goldgolia_project/controller/view/control_app_view_provider.dart';
import 'package:goldgolia_project/helper/router_helper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ControlAppViewProvider()),
          ChangeNotifierProvider(create: (_) => AuthViewProvider()),
        ],
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        unselectedWidgetColor: Colors.grey, 
      ),
      debugShowCheckedModeBanner: false,
      getPages: RouterHelper.routes,
    );
  }
}
