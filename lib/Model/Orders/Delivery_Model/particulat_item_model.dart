import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

//ParticularItemModel welcomeFromJson(String str) => ParticularItemModel.fromJson(json.decode(str));

//String welcomeToJson(ParticularItemModel data) => json.encode(data.toJson());

class ParticularDeliveryItemModel {
  String message;
  bool error;
  Data? data;

  ParticularDeliveryItemModel({
    required this.message,
    required this.error,
    required this.data,
  });

  factory ParticularDeliveryItemModel.fromJson(Map<String, dynamic> json) =>ParticularDeliveryItemModel(
    message: json["message"],
    error: json["error"],
    data: json["data"] != null ?  Data.fromJson(json["data"]) : null,
  );

  // Map<String, dynamic> toJson() => {
  //   "message": message,
  //   "error": error,
  //   "data": data.toJson(),
  // };
}

class Data {
  int? orderId;
  int? sellerId;
  int? customerId;
  String? orderType;
  String? orderStatus;
  int? totalAmount;
  String? paymentGateway;
  String? paymentStatus;
  List<OrderedProducts>? orderedProducts;
  BillingDetails? billingDetails;
  DeliveryDetails? deliveryDetails;
  int? contactNumber;
  String? createdAt;

  Data({
    required this.orderId,
    required this.sellerId,
    required this.customerId,
    required this.orderType,
    required this.orderStatus,
    required this.totalAmount,
    required this.paymentGateway,
    required this.paymentStatus,
    required this.orderedProducts,
    required this.billingDetails,
    required this.deliveryDetails,
    required this.contactNumber,
    required this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json)
      {
        final dateFormat = DateFormat("yyyy-MM-dd hh:mm:ss a");
        return Data(
          orderId: json["orderId"] = 0,
          sellerId: json["sellerId"] = 0,
          customerId: json["customerId"] = 0,
          orderType: json["orderType"] = "",
          orderStatus: json["orderStatus"] = "",
          totalAmount: json["totalAmount"] = 0,
          paymentGateway: json["paymentGateway"] = "",
          paymentStatus: json["paymentStatus"] = "",
          orderedProducts: json["orderedProducts"] != null
              ? (json["orderedProducts"] is String
                  ? List<OrderedProducts>.from(
                      jsonDecode(json["orderedProducts"])
                          .map((x) => OrderedProducts.fromJson(x)))
                  : List<OrderedProducts>.from(json["orderedProducts"]
                      .map((x) => OrderedProducts.fromJson(x))))
              : [],
          billingDetails: json["billingDetails"] != null
              ? (json["billingDetails"] is String
                  ? BillingDetails.fromJson(jsonDecode(json["billingDetails"]))
                  : BillingDetails.fromJson(json["billingDetails"]))
              : null,
          deliveryDetails: json["deliveryDetails"] != null
              ? (json["deliveryDetails"] is String
                  ? DeliveryDetails.formJson(
                      jsonDecode(json["deliveryDetails"]))
                  : DeliveryDetails.formJson(json["deliveryDetails"]))
              : null,
          contactNumber: json["contactNumber"],
          createdAt: json["createdAt"] ?? ""
        );
      }

  // Map<String, dynamic> toJson() => {
  //   "orderId": orderId,
  //   "sellerId": sellerId,
  //   "customerId": customerId,
  //   "orderType": orderType,
  //   "orderStatus": orderStatus,
  //   "totalAmount": totalAmount,
  //   "paymentGateway": paymentGateway,
  //   "paymentStatus": paymentStatus,
  //   "orderedProducts": orderedProducts,
  //   "billingDetails": billingDetails,
  //   "deliveryDetails": deliveryDetails,
  //   "contactNumber": contactNumber,
  //   "createdAt": createdAt,
  // };
}

//"orderedProducts": "[{\"productId\":1,\"productName\":\"Pineapple\",\"cartQty\":1,\"productQty\":\"2 kg\",\"price\":90}]",
class OrderedProducts {
  int? productId;
  String? productName;
  int? cartQty;
  String? productQty;
  int? price;

  OrderedProducts({
    required this.productId,
    required this.productName,
    required this.cartQty,
    required this.productQty,
    required this.price,
  });

  factory OrderedProducts.fromJson(Map<String, dynamic> json) => OrderedProducts(
      productId: json["productId"] = 0,
      productName: json["productName"] = "",
      cartQty: json["cartQty"] = 0,
      productQty: json["productQty"] ="",
      price: json["price"] = 0);
}

//"billingDetails": "{\"paymentGateway\":\"cod\",\"deliveryCharge\":0,\"subtotal\":\"100356.00\",\"discount\":100266,\"total\":90,\"deliveryFee\":30,\"promoCodeUsed\":\"\",\"promoCodeDiscount\":0}",

class BillingDetails{
  String? paymentGateway;
  int? deliveryCharge;
  double? subtotal;
  double? discount;
  double? total;
  double? deliveryFee;
  String? promoCodeUsed;
  int? promoCodeDiscount;

  BillingDetails({
    required this.paymentGateway,
    required this.deliveryCharge,
    required this.subtotal,
    required this.discount,
    required this.total,
    required this.deliveryFee,
    required this.promoCodeUsed,
    required this.promoCodeDiscount,
  });

  factory BillingDetails.fromJson(Map<String,dynamic> json) => BillingDetails(
      paymentGateway: json["paymentGateway"] = "",
      deliveryCharge: json["deliveryCharge"] = 0,
      subtotal: json["subtotal"] = 0.0,
      discount: json["discount"] = 0.0 ,
      total: json["total"] = 0.0,
      deliveryFee: json["deliveryFee"] = 0.0,
      promoCodeUsed: json["promoCodeUsed"] = "",
      promoCodeDiscount: json["promoCodeDiscount"] = 0);
}
//"deliveryDetails": "{\"type\":\"Pickup\",\"deliveryOption\":\"\",\"expected\":\"2024-12-17 09:10:00 PM\",\"deliveryStatus\":\"pending\",\"address\":\"north street\"}",

class DeliveryDetails{
  String? type;
  String? deliveryOption;
  DateTime? expected;
  String? deliveryStatus;
  String? address;

  DeliveryDetails({
    required this.type,
    required this.deliveryOption,
    required this.expected,
    required this.deliveryStatus,
    required this.address,
});

  factory DeliveryDetails.formJson(Map<String,dynamic> json) {

    final dateFormat = DateFormat("yyyy-MM-dd hh:mm:ss a");
    return DeliveryDetails(
        type: json["type"] = "",
        deliveryOption: json["deliveryOption"] = "",
        expected: json["expected"] != null
            ? dateFormat.parse(json["expected"])
            : DateTime.now(),
        deliveryStatus: json["deliveryStatus"] = "",
        address: json["address"] = "");
  }
}
