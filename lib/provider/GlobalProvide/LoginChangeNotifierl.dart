import 'dart:convert';

import 'package:eatfit_delivery_partner/Model/AccountLogin/loginModel.dart';
import 'package:eatfit_delivery_partner/provider/GlobalProvide/profileNotifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Go_Router/routeDefination.dart';
import '../../helper/helperClass.dart';
import '../../network/Service/login_service.dart';
import '../../network/Service/updateProfile.dart';


class LoginProvider with ChangeNotifier{

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  LoginModel? _logindata;
  LoginModel? get logindata => _logindata;


  final LoginService loginService = LoginService();
  final UpdateProfileService updateProfileImage = UpdateProfileService();

  String? _bearertoken;
  String? get bearertoken => _bearertoken;

  final profileInstance = profileNotifier();

  Future loginAPI({required String mobileNumber, required String password, required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();

    try {
      print("$mobileNumber $password");
      _logindata = await loginService.loginapi(mobilenumber: mobileNumber, password: password);
      notifyListeners();

      if (_logindata != null && _logindata!.error) {
        _errorMessage = _logindata!.message;
      } else {

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('deliveryPersonId', _logindata!.data!.deliveryPersonId );
        await prefs.setString('email', _logindata!.data!.email );
        await prefs.setString('bearerToken',_logindata!.data!.bearerToken);
        Helper.deliveryPersonId = _logindata!.data!.deliveryPersonId;

        context.push(pageRoute.onSuccess);
        notifyListeners();

        await profileInstance.fetchProfileDetailsApi();
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
      print("The error is $e");

    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
