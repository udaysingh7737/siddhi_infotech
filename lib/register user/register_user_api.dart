import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:siddhi_infotech/register%20user/register_user_model.dart';

import '../constants.dart';
import 'already_register_model.dart';

class RegisterUserApi{



  static Future registerUserApi({
    firstName,lastName,email,address,password,gender,instaId,photoPath = "",}) async{
    String gen = gender == "Male" ? "1" : gender == "Female" ? "2" :"3";

    final Map<String,String> body = {
    "first_name":firstName,
    "last_name":lastName,
    "email":email,
    "password":password,
    "is_term_accept":"1",
    "role":"3",
    "dob":"22-08-1994",
    "gender":gen,
    "address":address,
    "instagram_client_id":instaId,
    };


    final request= http.MultipartRequest('POST',Uri.parse(url+"register"),);
    request.headers.addAll(headerData);
    request.fields.addAll(body);
    // request.files.add(
    //     await http.MultipartFile.fromPath("profile_img", photoPath,)
    // );
    final response = await http.Response.fromStream(await request.send());
    print(jsonDecode(response.body));
    final data = jsonDecode(response.body);
    if( data["data"]["message"] =="You have registered successfully."){
      return RegisterUserModel.fromJson(jsonDecode(response.body));
    }else{
      return AlreadyRegisterUserModel.fromJson(jsonDecode(response.body));
    }



  }
}
