import 'dart:convert';

//Orders (String str) => OrdersData.fromJson(json.decode(str));

//String welcomeToJson(OrdersData data) => json.encode(data.toJson());

class DeliveredData {
  String message;
  bool error;
  List<DeliveredOrderedProduct>? data;

  DeliveredData({
    required this.message,
    required this.error,
    required this.data,
  });
}

class DeliveredOrderedProduct {
  int orderId;
  int deliveryPersonId;
  int sellerId;
  int customerId;
  String orderStatus;
  String totalAmount;
  String paymentGateway;
  String paymentStatus;
  int contactNumber;
  DateTime createdAt;

  DeliveredOrderedProduct({
    required this.orderId,
    required this.deliveryPersonId,
    required this.sellerId,
    required this.customerId,
    required this.orderStatus,
    required this.totalAmount,
    required this.paymentGateway,
    required this.paymentStatus,
    required this.contactNumber,
    required this.createdAt,
  });
}