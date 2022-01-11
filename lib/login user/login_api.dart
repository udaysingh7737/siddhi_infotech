
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:siddhi_infotech/constants.dart';
import 'package:siddhi_infotech/login%20user/invalid_login_user_model.dart';
import 'package:siddhi_infotech/login%20user/login_user_model.dart';


class LoginUserAPI {

  static Future<dynamic> loginUser({required email,required password}) async {
    final response = await http.post(Uri.parse(url+"login"),
        headers: headerData,
        body: {
        "email":email,
        "password":password,
        }
    );
    final data = jsonDecode(response.body);
    if (kDebugMode) {
      print(data);
    }

    if( data["data"]["message"] == "Invalid Credentials! Please try again."){
      return InvalidLoginUserModel.fromJson(data);
    }else{
      return LoginUserModel.fromJson(data);
    }


  }


}