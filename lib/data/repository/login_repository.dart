import 'dart:async';

import 'package:boring_flutter_app/data/model/login_model.dart';
import 'package:boring_flutter_app/res/strings/strings.dart';

class LoginRepo {
  Future requestLogin(myUsername, myPassword) async {
    print("Data $myPassword $myUsername");

    try {
      if (myUsername == "admin" && myPassword == "admin123" ||
          myUsername == "alam" && myPassword == "alam123") {
        var response = {};
        await Future.delayed(Duration(seconds: 5), () {
          response = {"username": myUsername, "password": myPassword};
        });
        print("Response $response");
        return response;
      } else {
        var response = 0;
        await Future.delayed(Duration(seconds: 5), () {
          response = null;
        });
        return response;
      }
    } catch (e) {
      throw Exception();
    }
  }
}
