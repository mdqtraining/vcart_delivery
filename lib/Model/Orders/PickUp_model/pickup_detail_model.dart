class GetParticularPickyModel {
  String message;
  bool error;
  List<particularData>? data;

  GetParticularPickyModel({
    required this.message,
    required this.error,
    required this.data,
  });

  factory GetParticularPickyModel.fromJson(Map<String, dynamic> json) {
    try{
      return GetParticularPickyModel(
          message: json["message"],
          error: json["error"],
          data: json["data"] != null && json["data"] is List
              ? List<particularData>.from(
                  json["data"].map((x) => particularData.fromJson(x)))
              : []);
    }catch(e){
      print("");
    rethrow;}
  }

}

class particularData {
  int? orderId;
  int? deliveryPersonId;
  int? sellerId;
  int? customerId;
  String? orderStatus;
  String? totalAmount;
  String? paymentGateway;
  String? paymentStatus;
  int? contactNumber;
  String? shopName;
  String? sellerName;
  String? sellerMobile;
  String? sellerShopImage;
  String? sellerAddress;
  String? sellerCity;
  String? sellerState;
  int? sellerPincode;
  String? sellerCountry;
  DateTime? createdAt;

  particularData({
    required this.orderId,
    required this.deliveryPersonId,
    required this.sellerId,
    required this.customerId,
    required this.orderStatus,
    required this.totalAmount,
    required this.paymentGateway,
    required this.paymentStatus,
    required this.contactNumber,
    required this.shopName,
    required this.sellerName,
    required this.sellerMobile,
    required this.sellerShopImage,
    required this.sellerAddress,
    required this.sellerCity,
    required this.sellerState,
    required this.sellerPincode,
    required this.sellerCountry,
    required this.createdAt,
  });

  factory particularData.fromJson(Map<String, dynamic> json)
  {
    try {
      return particularData(
        orderId: json["orderId"] ?? 0,
        deliveryPersonId: json["deliveryPersonId"] ?? 0,
        sellerId: json["sellerId"] ?? 0,
        customerId: json["customerId"] ?? 0,
        orderStatus: json["orderStatus"] ?? "",
        totalAmount: json["totalAmount"] ?? "",
        paymentGateway: json["paymentGateway"] ?? "",
        paymentStatus: json["paymentStatus"] ?? "",
        contactNumber: json["contactNumber"] ?? 0,
        shopName: json["shopName"] ?? "",
        sellerName: json["sellerName"] ?? "",
        sellerMobile: json["sellerMobile"] ?? "",
        sellerShopImage: json["sellerShopImage"] ?? "",
        sellerAddress: json["sellerAddress"] ?? "",
        sellerCity: json["sellerCity"] ?? "",
        sellerState: json["sellerState"] ?? "",
        sellerPincode: json["sellerPincode"] ?? 0,
        sellerCountry: json["sellerCountry"] ?? "",
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}