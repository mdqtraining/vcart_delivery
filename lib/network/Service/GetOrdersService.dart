import 'package:dio/dio.dart';
import 'package:eatfit_delivery_partner/Model/Orders/orders_getall.dart';
import 'package:eatfit_delivery_partner/network/Url/urlCollection.dart';

import '../../helper/helperClass.dart';

class GetOrdersService extends UrlCollection{

  Future<dynamic> getOrderService({required int deliveryPersonId, String? orderStatus, String? dateFilter}) async{
            final dio = Dio();

            try{
              FormData formdata = FormData.fromMap(
                  {'deliveryPersonId' : deliveryPersonId,
                  'orderStatus' : orderStatus,
                  'dateFilter' : dateFilter}
              );
              
              var response = await dio.post(UrlCollection.deliveryOrderList,
              options: Options(
                headers: {
                  "Accept":"application/json",
                  "x-api-key": Helper.token},
                  followRedirects: false,
                validateStatus: (status){
                  return status! <=500;
                },
              ),data: formdata);

              print("::::::::GetOrdersService:::::::::");
              print(response.statusCode);
              print(response.data);

              if(response.statusCode == 200 || response.statusCode ==201){
                return OrdersData.fromJson(response.data);
              }else{
                print("No data found");
              }
            }catch(e){
                  print("::::::::Exception in delivery person Service:::::::::::>");
                  print(e);
            }
  }
}