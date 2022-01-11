import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:siddhi_infotech/register%20user/register_user_model.dart';

import 'offer_list_model.dart';



class GetOfferListAPI{

  static const urlNew = "http://tagyou.siddhidevelopment.com/api/v1/offers";


  static Future<OfferListModel> getOfferListApi({required token}) async{
    print(token);

    Map<String, String> headerData = {
      "Accept":"application/json",
      "lang":"en",
      "apiKey":"T56c5+xwOzn/BjwN774rJ6ugk8i/N7GYJuL2KpxXhuo=",
      "appversion":"v1",
      "deviceId":"123",
      "deviceType":"1",
      "deviceToken":"1234",
      "Authorization": "Bearer " + token,
    };

    final request= http.MultipartRequest('GET',Uri.parse(urlNew),);
    request.headers.addAll(headerData);
    final response = await http.Response.fromStream(await request.send());
    print(jsonDecode(response.body));
    final data = jsonDecode(response.body);
    print(data);
    print("--------+*****-----");
    log(data);

    return OfferListModel.fromJson(jsonDecode(response.body));

    // if( data["data"]["message"] =="You have registered successfully."){
    //   return RegisterUserModel.fromJson(jsonDecode(response.body));
    // }else{
    //
    // }



  }


  static Future<OfferListModel> getPage({required token}) async {

    Map<String, String> headerData = {
      "Accept":"application/json",
      "lang":"en",
      "apiKey":"T56c5+xwOzn/BjwN774rJ6ugk8i/N7GYJuL2KpxXhuo=",
      "appversion":"v1",
      "deviceId":"123",
      "deviceType":"1",
      "deviceToken":"1234",
      "Authorization": "Bearer " + token,
    };

    final response = await http.get(Uri.parse(urlNew), headers: headerData,);

    print(jsonDecode(response.body));
    return OfferListModel.fromJson(jsonDecode(response.body));
  }
}
