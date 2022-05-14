import 'package:goldgolia_project/helper/http_helper.dart';
import 'package:goldgolia_project/util/constants.dart';

class UserRepo {
  static Future signUpUser(Map<String, dynamic> data) async {
    final response =
        await HttpHelper.post(url: Constants.apiTalentedReg, data: data);
    return response;
  }
}
