import 'package:get/get.dart';
import 'package:goldgolia_project/view/pages/auth/main_auth_page.dart';
import 'package:goldgolia_project/view/pages/auth/screen/join_as_screen.dart';
import 'package:goldgolia_project/view/pages/auth/screen/personal_information_screen.dart';
import 'package:goldgolia_project/view/pages/auth/screen/pick_talents_screen.dart';
import 'package:goldgolia_project/view/pages/home/main_home_page.dart';

class RouterHelper {
  static const String splashPage = '/';
  static const String authPage = '/auth';
  static const String authjoinAsScreen = '/authjoinAsScreen';
  static const String authPersionalInformationScreen =
      '/authPersionalInformationScreen';
  static const String authPickTalentsScreen = '/authPickTalentsScreen';
  static const String homePage = '/home';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => const MainAuthPage()),
    GetPage(name: authPage, page: () => const MainAuthPage()),
    GetPage(name: authjoinAsScreen, page: () => const JoinAsScreen()),
    GetPage(
      name: authPersionalInformationScreen,
      page: () => PersionalInformationScreen(),
    ),
    GetPage(
      name: authPickTalentsScreen,
      page: () => const PickTalentsScreen(),
    ),
    GetPage(name: homePage, page: () => const MainHomePage()),
  ];
}
