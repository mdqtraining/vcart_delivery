import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/AccountLogin/loginModel.dart';
import '../Url/urlCollection.dart';
import 'package:dio/dio.dart';

class LoginService extends UrlCollection {

  Future loginapi({
    required String mobilenumber, required String password})async{

    dynamic responseJson;

    try{
      var dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      String? authtoken = prefs.getString("authtoken");

      FormData formdata = FormData.fromMap({
        "deliveryPersonMobile":mobilenumber,
        "deliveryPersonPassword":password
      });
      var response = await dio.post(UrlCollection.Login,
        options: Options(
          headers: {
            "Accept":"application/json"
          },
          followRedirects: false,
          validateStatus: (status){
            return status! <=500;
          }
        ),
        data: formdata
      );
          print("::::::::::::::::Login Api Service:::::::::::::<status code>::::::::::::");
          print(response.statusCode);
          print(response.data);
          responseJson = response;
      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginModel.fromJson(response.data);
      } else {
        print("No data found");
      }
    }

    on SocketException{
      print("no internet");
    }
  }
}

// import '../../Model/AccountLogin/loginModel.dart';
// import '../Url/urlCollection.dart';
// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// class LoginService{
//
//   Future<LoginModel?> loginService(String mobile,String password) async{
//     try{
//       //print(login.deliveryPersonMobileNumber);
//       final LoginUrl = '${UrlCollection.Login}';
//
//       final uri = Uri.parse(LoginUrl);
//
//
//       final response = await http.post(uri,
//         body: jsonEncode({
//           'deliveryPersonMobile' : mobile,
//           'deliveryPersonPassword' : password,
//           }),
//         headers: {'Content-Type': 'application/json'},);
//       print(response.statusCode);
//       // print(login.deliveryPersonPassword);
//       // print(login.deliveryPersonMobileNumber);
//
//       if (response.statusCode == 200) {
//         //Map<String, dynamic> jsonResponse = jsonDecode(response.body);
//         LoginModel jsonResponse = loginModelFromJson(response.body);
//         //var loginData = loginCredential.fromJson(jsonResponse);
//         //print(loginData);
//
//         //print(loginCredential.fromJson(jsonResponse));
//          if(jsonResponse.error == false ) {
//            print(jsonResponse.message);
//         }else{
//            print(jsonResponse.message);
//          }
//         //print(loginData.deliveryPersonMobile);
//         return jsonResponse;
//       } else {
//         print("error");
//         return null;
//       }
//     }catch(e){
//       print("The error $e");
//       return null;}
//   }
// }
//
//
//
// // if(response.statusCode == 200){
// // //List<dynamic> jsonResponse = JsonDecode(response.body);
// // List<dynamic> jsonResponse = jsonDecode(response.body);
// //
// // var loginData = jsonResponse.map((e) {
// // return loginCredential.fromJson(e);
// // }).toList();
// // print("login Successfull");
// // return loginData;
// // }else{
// // print("error");
// // return[];
// // }