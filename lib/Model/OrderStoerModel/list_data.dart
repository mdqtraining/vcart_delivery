class OrderData{
  int? orderNumber;
  //String pickupStatus;
  String? customer_name;
  String? delivery_address;
  String? pickup_address;
  String? food_name;
  double weight;
  int quanity ;
  int? product_amount;
  String status;

  OrderData({
    required this.orderNumber,
    //this.pickupStatus = "pickup pending",
    required this.customer_name,
    required this.delivery_address,
    required this.pickup_address,
    required this.food_name,
    this.weight = 0.0,
    this.quanity = 0,
    required this.status ,
    required this.product_amount});
  
  static List<OrderData> order_Data_set(){
    return[
      OrderData(orderNumber: 1234,
          customer_name: "John Doe",
          delivery_address: "No.9B, Ganga Griha, 1st Floor, Nungambakkam High Road, Land Mark: opposite to Ispahani Centre, Chennai",
          pickup_address: "64/1, Off Arcot Road Alwarthirunagar Annex, 1st Main Rd, Alwartirunagar, Chennai,",
          food_name: "Pizza",
          status: "Delivery pending",
          product_amount: 2000),

      OrderData(orderNumber: 1235,
          customer_name: "Pasupathy",
          delivery_address: "112, Old Mahabalipuram Rd, Phase-2, Thirumalai Nagar Annexe, Perungudi, Chennai",
          pickup_address: "No. 327, First Floor, Avvai Shanmugam Salai, Royapettah, Chennai,",
          food_name: "Pizza",
          status: "Delivered",
          product_amount: 500),

      OrderData(orderNumber: 1236,
          customer_name: "Illaiya raja",
          delivery_address: "Crystal Lawn - Ground Floor,No. 20, Wallace Garden Road, Nungambakkam, Chennai,",
          pickup_address: "106 107 Thirumalai Annexure NKS Buildings, Old Mahabalipuram Rd, Chennai,",
          food_name: "Dominos",
          status: "pickup Rescheduled",
          product_amount: 1500),

      OrderData(orderNumber: 1239,
          customer_name: "Raghul",
          delivery_address: "No 81, Bypass Road, Rajalaksmi Nagar, Velachery First Floor,",
          pickup_address: "73/1 Sterling Road ,1st and 2nd floor Nungambakkam, opposite Loyola College,",
          food_name: "Pizza",
          status: "Delivery failed",
          product_amount: 3200),

      OrderData(orderNumber: 2343,
          customer_name: "Michale Jackson",
          delivery_address: "No. 311, 122/B, Manickam Ave, Alwarpet, Chennai, ",
          pickup_address: "New No.215, Old No., 95, TT Krishnamachari Rd, behind LG Electronics, Teynampet, Chennai,",
          food_name: "Pizza",
          status: "Delivery pending",
          product_amount: 100),

      OrderData(orderNumber: 9898,
          customer_name: "Donald Trumph",
          delivery_address: "W 102, 2nd Avenue, next to indian Bank,, Chennai,",
          pickup_address: "209, Kutchery Rd, Vinayaka Nagar Colony, Mylapore, Chennai, T",
          food_name: "Pizza",
          status: "Delivered",
          product_amount: 2000),

      OrderData(orderNumber: 1245,
          customer_name: "Ronaldo",
          delivery_address: "24/6, 1st Main Rd, opposite to SBI, United India Colony, Kodambakkam, Chennai, ",
          pickup_address: "10, 1st Main Rd, opposite to Liberty Park Hotel, United India Colony, Kodambakkam, Chennai,",
          food_name: "Pizza",
          status: "pickup failed",
          product_amount: 4000),

      OrderData(orderNumber: 1290,
          customer_name: "Roman Reigns",
          delivery_address: "No 22, 1st Floor, Khader Nawaz Khan Rd, Srirampuram, Thousand Lights, Chennai,",
          pickup_address: "Dominos",
          food_name: "Pizza",
          status: "pickup pending",
          product_amount: 9000),
    ];
  }
}




// <ordernumber int uniqe,
// name String, address of pickupcenter String, food nam, weight, quantity int, amount, order status>