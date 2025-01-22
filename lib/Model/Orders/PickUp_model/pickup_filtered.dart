class PickupDataFiltered {
  String message;
  bool error;
  List<particularDataFiltered>? data;

  PickupDataFiltered({
    required this.message,
    required this.error,
    required this.data,
  });
}

class particularDataFiltered {
  int? orderId;
  int? deliveryPersonId;
  int? sellerId;
  int? customerId;
  String? orderStatus;
  String? totalAmount;
  String? paymentGateway;
  String? paymentStatus;
  int?  contactNumber;
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

  particularDataFiltered({
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
}