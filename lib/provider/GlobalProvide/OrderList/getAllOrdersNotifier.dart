import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/OrderStoerModel/list_data.dart';
import '../../../Model/Orders/orders_getall.dart';
import '../../../helper/helperClass.dart';
import '../../../network/Service/GetOrdersService.dart';
import '../../../network/Service/deliveryPersonProfile.dart';

class getOrders_Notifier extends ChangeNotifier{
  
  final GetOrdersService deliverySerivce = GetOrdersService();

  OrdersData? _orderModel;
  OrdersData? get orderModel => _orderModel;


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _erroText;
  String? get errorText => _erroText;

  Future getAllOrders({required int deliveryPersonId,String? orderStatus, String? dateFilter}) async{
    
    _isLoading = true;
    notifyListeners();
    try{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final deliverID = prefs.getInt('deliveryPersonId');

      _orderModel = await deliverySerivce.getOrderService(
          deliveryPersonId: deliveryPersonId,
          orderStatus: orderStatus,
          dateFilter: dateFilter);
      notifyListeners();

      if (_orderModel != null && _orderModel!.error == true) {
        _erroText = "The form is incoreect";
        print("error found");
      } else {

        //ToDo: Task1 completed

        // if(_orderModel?.data != null)
        // {
        //   for (var order in _orderModel!.data!) {
        //     if (order.orderId != null) {
        //       //Helper.orderId.add(order.orderId);
        //       Helper.orderId = order.orderId;
        //     }
        //   }
        // }
        print("The process was SuccessFull");
      }
    }catch(e){
      print("::::::Exception in GetOrderNotifier::::::::");
      print(e);
    }
    finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}