import 'package:eatfit_delivery_partner/helper/helperClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/Orders/PickUp_model/pickup_detail_model.dart';
import '../../../network/Service/GetParticularPickupService.dart';

class ParticularPickupItemNotifier extends ChangeNotifier{

  final GetParticularPickupService particularPickupitem =GetParticularPickupService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  GetParticularPickyModel? _particularPickupData;
  GetParticularPickyModel? get particularPickupData => _particularPickupData;

  Future getPickupData({required int deliveryPersonId}) async{

    _isLoading = true;
    notifyListeners();
    try{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final deliveryId = prefs.getInt('deliveryPersonId') ?? 0;
    _particularPickupData = await particularPickupitem
        .getPartiularItem(deliveryPersonId: deliveryPersonId);
    notifyListeners();

    print("::::::::Success full message from particular pickup ItemDat:::::::::::");
    print(_particularPickupData?.message);
    //   print(_particularPickupData?.error);
    // print(_particularPickupData?.data?[0].orderStatus);
    //   print(_particularPickupData?.data?[0].totalAmount);
  }catch(e){
  print(e);
  }finally{
  _isLoading = false;
  notifyListeners();
  }
  }
}