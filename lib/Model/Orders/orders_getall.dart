import 'dart:convert';

Orders (String str) => OrdersData.fromJson(json.decode(str));

String welcomeToJson(OrdersData data) => json.encode(data.toJson());

class OrdersData {
  String message;
  bool error;
  List<OrderedProduct>? data;

  OrdersData({
    required this.message,
    required this.error,
    required this.data,
  });

  factory OrdersData.fromJson(Map<String, dynamic> json) => OrdersData(
    message: json["message"],
    error: json["error"],
    data: json["data"] != null ?
          List<OrderedProduct>.from(json["data"].map((x) => OrderedProduct.fromJson(x)))
        : null
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
    "data": List<dynamic> == null ? null : List<dynamic>.from(data!.map((x) => x.toJson()))
  };
}

class OrderedProduct {
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

  OrderedProduct({
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

  factory OrderedProduct.fromJson(Map<String, dynamic> json) => OrderedProduct(
    orderId: json["orderId"] ?? 0,
    deliveryPersonId: json["deliveryPersonId"] ?? 0,
    sellerId: json["sellerId"] ?? 0,
    customerId: json["customerId"] ?? 0,
    orderStatus: json["orderStatus"] ?? "",
    totalAmount: json["totalAmount"] ?? "",
    paymentGateway: json["paymentGateway"] ?? "",
    paymentStatus: json["paymentStatus"] ?? "",
    contactNumber: json["contactNumber"] ?? 0,
    createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "deliveryPersonId": deliveryPersonId,
    "sellerId": sellerId,
    "customerId": customerId,
    "orderStatus": orderStatus,
    "totalAmount": totalAmount,
    "paymentGateway": paymentGateway,
    "paymentStatus": paymentStatus,
    "contactNumber": contactNumber,
    "createdAt": createdAt.toIso8601String(),
  };
}