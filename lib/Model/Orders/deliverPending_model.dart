
class DeliverPendingModel {
  String message;
  bool error;
  List<DeliverPendingModeldata>? data;

  DeliverPendingModel({
    required this.message,
    required this.error,
    required this.data,
  });
}

class DeliverPendingModeldata {
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

  DeliverPendingModeldata({
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