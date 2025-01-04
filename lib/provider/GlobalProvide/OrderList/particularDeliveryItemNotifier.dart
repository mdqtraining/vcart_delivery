import 'package:flutter/material.dart';

import '../../../Model/Orders/Delivery_Model/particulat_item_model.dart';
import '../../../network/Service/GetParticularDeliveryService.dart';

class GetParticularDeliveryItem extends ChangeNotifier{

  final GetParticularOrderService particularItem = GetParticularOrderService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  ParticularDeliveryItemModel? _particularItemData;
  ParticularDeliveryItemModel? get particularItemData => _particularItemData;

  Future getDeliveryItem({required int deliveryPersonId, required int orderId}) async{
    _isLoading = true;
    notifyListeners();

    try {
      _particularItemData = await particularItem.getPartiularIte(
          deliveryPersonId: deliveryPersonId, orderId: orderId);
      notifyListeners();

      print("::::::::Success full message from particular ItemDat:::::::::::");
      print(_particularItemData?.message);
    }catch(e){
      print(e);
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}