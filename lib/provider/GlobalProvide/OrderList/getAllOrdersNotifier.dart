import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Model/Orders/deliverPending_model.dart';
import '../../../Model/Orders/delivered_details.dart';
import '../../../Model/Orders/orders_getall.dart';
import '../../../network/Service/GetOrdersService.dart';
import '../../../network/Service/updateStatus.dart';

class getOrders_Notifier extends ChangeNotifier{
  
  final GetOrdersService deliverySerivce = GetOrdersService();
  final updateStatusService updateStatus = updateStatusService();

  OrdersData? _orderModel;
  OrdersData? get orderModel => _orderModel;

  DeliveredData? _deliveredData;
  DeliveredData? get deliveredData => _deliveredData;

  DeliverPendingModel? _deliveryPending;
  DeliverPendingModel? get deliveryPending => _deliveryPending;

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

        final filteredList = orderModel?.data!
            .where((order) => order.orderStatus?.toLowerCase() == "delivered")
            .map((order) => DeliveredOrderedProduct(

          orderId: order.orderId,
          deliveryPersonId: order.deliveryPersonId,
          sellerId: order.sellerId,
          customerId: order.customerId,
          orderStatus: order.orderStatus ?? "vanakam da mapla",
          totalAmount: order.totalAmount,
          paymentGateway: order.paymentGateway,
          paymentStatus: order.paymentStatus,
          contactNumber: order.contactNumber,
          createdAt: order.createdAt,
        )).toList();

        _deliveredData ??= DeliveredData(message: '',error: false,data: []); // Ensure it's initialized
        _deliveredData?.data = filteredList;
        notifyListeners();

        final deliverPendingFiltered = orderModel?.data!
            .where((order) => order.orderStatus.toLowerCase() != "out for pickup" &&
            order.orderStatus?.toLowerCase() != "delivered" &&
            order.orderStatus?.toLowerCase() != "failed delivery attempt")
            .map((order) => DeliverPendingModeldata(
          orderId: order.orderId,
          deliveryPersonId: order.deliveryPersonId,
          sellerId: order.sellerId,
          customerId: order.customerId,
          orderStatus: order.orderStatus ,
          totalAmount: order.totalAmount,
          paymentGateway: order.paymentGateway,
          paymentStatus: order.paymentStatus,
          contactNumber: order.contactNumber,
          createdAt: order.createdAt,
        )).toList();

        _deliveryPending ??= DeliverPendingModel(message: '',error: false,data: []); // Ensure it's initialized
        _deliveryPending?.data = deliverPendingFiltered;
        notifyListeners();

        print("::::::::::::Output from Notifier:::::::::::::::::::");
        print(deliveredData?.data?.first.orderStatus);


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