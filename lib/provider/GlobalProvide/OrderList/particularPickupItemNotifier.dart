import 'package:eatfit_delivery_partner/helper/helperClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/Orders/PickUp_model/pickup_detail_model.dart';
import '../../../Model/Orders/PickUp_model/pickup_filtered.dart';
import '../../../network/Service/GetParticularPickupService.dart';

class ParticularPickupItemNotifier extends ChangeNotifier{

  final GetParticularPickupService particularPickupitem =GetParticularPickupService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  PickupDataFiltered? _pickupFiltered;
  PickupDataFiltered? get pickupFiltered => _pickupFiltered;

  GetParticularPickyModel? _particularPickupData;
  GetParticularPickyModel? get particularPickupData => _particularPickupData;

  List<bool> _isExpanded = [];
  List<bool> get isExpanded => _isExpanded;

  Future getPickupData({required int deliveryPersonId}) async{

    _isLoading = true;
    notifyListeners();
    try{

    _particularPickupData = await particularPickupitem
        .getPartiularItem(deliveryPersonId: deliveryPersonId);
    notifyListeners();

    if(_particularPickupData != null && _particularPickupData?.error == true){
      print("no data found");
    }else{
      final ordersCount = particularPickupData?.data?.length ?? 0;
      _isExpanded = List.generate(ordersCount, (_) => false);

      notifyListeners();

     final filteredList = particularPickupData?.data!
      .where((pickupOrder) =>
     pickupOrder.orderStatus?.toLowerCase() == "failed delivery attempt"
     || pickupOrder.orderStatus?.toLowerCase() == "out for pickup")
      .map((pickupOrder) => particularDataFiltered(

       orderId: pickupOrder.orderId,
       deliveryPersonId: pickupOrder.deliveryPersonId,
       sellerId: pickupOrder.sellerId,
       customerId: pickupOrder.customerId,
       orderStatus: pickupOrder.orderStatus,
       totalAmount: pickupOrder.totalAmount,
       paymentGateway: pickupOrder.paymentGateway,
       paymentStatus: pickupOrder.paymentStatus,
       contactNumber: pickupOrder.contactNumber,
       shopName: pickupOrder.shopName,
       sellerName: pickupOrder.sellerName,
       sellerMobile: pickupOrder.sellerMobile,
       sellerShopImage: pickupOrder.sellerShopImage,
       sellerAddress: pickupOrder.sellerAddress,
       sellerCity: pickupOrder.sellerCity,
       sellerState: pickupOrder.sellerState,
       sellerPincode: pickupOrder.sellerPincode,
       sellerCountry: pickupOrder.sellerCountry,
       createdAt: pickupOrder.createdAt
     )).toList();

      _pickupFiltered ??= PickupDataFiltered(message: "", error: false, data: []);
      _pickupFiltered?.data = filteredList;
     notifyListeners();

    }

    print("::::::::Success full message from particular pickup ItemDat:::::::::::");
    print(_particularPickupData?.message);
    }catch(e){
         print(e);
       }finally{
            _isLoading = false;
             notifyListeners();
      }
  }
}