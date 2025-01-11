import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Model/Orders/orders_getall.dart';
import '../../../network/Service/GetOrdersService.dart';
import '../../../network/Service/updateStatus.dart';

class getOrders_Notifier extends ChangeNotifier{
  
  final GetOrdersService deliverySerivce = GetOrdersService();
  final updateStatusService updateStatus = updateStatusService();

  OrdersData? _orderModel;
  OrdersData? get orderModel => _orderModel;

  List<bool> _isExpanded = [];
  List<bool> get isExpanded => _isExpanded;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _erroText;
  String? get errorText => _erroText;

  Future getAllOrders({required int deliveryPersonId,String? orderStatus, DateTime? dateFilter}) async{
    
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
        final ordersCount = orderModel?.data?.length ?? 0;
        _isExpanded = List.generate(ordersCount, (_) => false);

        notifyListeners();

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

  Future updateStatusNotifier({required int deliveryPersonId, required int orderID, required int orderStatus}) async{
    try{

      //final message;
          await updateStatus.updateStatus(
            deliveryPersonId: deliveryPersonId,
            orderID: orderID,
           orderStatus: orderStatus);

         print("The process was completed successfully::::::::In updated Stat");

    }catch(e){
      print("No data Found:::::::::::::At Here::::::::::::>");
      print(e);
    }
  }
}