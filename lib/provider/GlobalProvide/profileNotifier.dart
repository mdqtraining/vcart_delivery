import 'dart:io';

import 'package:eatfit_delivery_partner/provider/GlobalProvide/LoginChangeNotifierl.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/deliveryPersonProfileUpdate/deliveryPersonProfile.dart';
import '../../Model/deliveryPersonProfileUpdate/updateProfileImage.dart';
import '../../network/Service/deliveryPersonProfile.dart';
import '../../network/Service/updateProfile.dart';


class profileNotifier extends ChangeNotifier{

  //final loginInstance = Provider.of<LoginProvider>(context,listen: false);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  deliveryPersonProfile? _profileData;
  deliveryPersonProfile? get profileData => _profileData;

  ProfileImage? _updateImage;
  ProfileImage? get updateImage => _updateImage;

  final deliveryPerson = DeliveyPersonProfileService();
  final updateProfileImage = UpdateProfileService();

  Future fetchProfileDetailsApi() async{

  final prefs = await SharedPreferences.getInstance();
  final delivery =  await prefs.getInt('deliveryPersonId') ?? 0;
  final email = await prefs.getString('email');
  final bearerToken = await prefs.getString('bearerToken') ?? "";

  try{
    if(email != null && delivery > 0 ){
        _profileData = await deliveryPerson.deliveyPersonProfile(
            deliveryPersonId: delivery, email: email,token: bearerToken);
        notifyListeners();
      }else{throw Exception('Missing credentials');}
    }
    catch(e){
       print(e);
  }
  finally{
    _isLoading = false;
    notifyListeners();
    }
  }

  Future updateProfile({required File profileImage}) async{

    final prefs = await SharedPreferences.getInstance();

    _updateImage ??= ProfileImage(deliveryPersonId: 0,email: "nothin@gmail.com",profileImage: null);
    _updateImage?.deliveryPersonId = await prefs.getInt('deliveryPersonId') ?? 0;
    _updateImage?.email = await prefs.getString('email');
    _updateImage?.profileImage = profileImage;

    try{
      //_updateImage ??= UpdateImage();
      if(_updateImage != null){

        print(_updateImage);
        await updateProfileImage.updateProfileService(profileUpdate: _updateImage!);
        notifyListeners();
      }else{
       print(":::::Erreor Casuse:::::In upload image api::::::::");

       print(_updateImage?.deliveryPersonId);
       print(_updateImage?.email);
       print(_updateImage?.profileImage);

        print(_updateImage);
        print("No data found");
      }
      print("The process was successfiull");
    }catch(e){
      print(":::::::Exception in Profile::::::Exception::::::");
      print(e);
    }
  }
}