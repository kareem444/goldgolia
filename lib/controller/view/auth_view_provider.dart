import 'package:flutter/cupertino.dart';
import 'package:goldgolia_project/helper/snack_bar_helper.dart';

class AuthViewProvider with ChangeNotifier {
  bool joinAsTalent = true;

  bool joinAsEmployer = false;
  bool employerIndvidual = false;
  bool employerCorporate = false;

  List<String> talentsList = [];

  handelJoinAsTalent() {
    joinAsTalent = true;
    joinAsEmployer = false;
    employerIndvidual = false;
    employerCorporate = false;
    notifyListeners();
  }

  handelJoinAsEmployer() {
    joinAsEmployer = true;
    joinAsTalent = false;
    employerIndvidual = true;
    employerCorporate = false;
    notifyListeners();
  }

  handleEmployerIndvidual() => handelJoinAsEmployer();

  handleEmployerCorporate() {
    joinAsEmployer = true;
    joinAsTalent = false;
    employerIndvidual = false;
    employerCorporate = true;
    notifyListeners();
  }

  handleTalentsList(BuildContext context, String val) {
    if (talentsList.contains(val)) {
      talentsList.remove(val);
    } else if (talentsList.length < 3) {
      talentsList.add(val);
    } else {
      SnackBarHelper.snakeBar(context: context, text: "Max Length Is 3");
    }
    notifyListeners();
  }
}
