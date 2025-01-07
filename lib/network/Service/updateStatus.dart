import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eatfit_delivery_partner/network/Url/urlCollection.dart';

class updateStatusService extends UrlCollection{



  Future updateStatus({required int deliveryPersonId,
    required int orderID,
    required int orderStatus})async {

    print("iam here");

    try {
      final dio = Dio();

      final FormData formData = FormData.fromMap({
        'deliveryPersonId': deliveryPersonId,
        'orderId': orderID,
        'orderStatus': orderStatus
      });

      print("i aaaam here.....");
      final response = await dio.post(UrlCollection.updateStatus,
          options: Options(headers: {
            "Accept": "application/json",
            "x-api-key": "655f636f6d6d657263655f6d6f62696c65"
          },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              }
          ),
          data: formData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        //return UpdateImagePhoto.fromJson(response.data);

        final responseData = response.data;

        String message = responseData['message'];
        bool error = responseData['error'];

        print(":::::::::::DAta Fetched SucCeSSFully:><::><::><:::::;:;;;:::::");
        print(message);
        //print(error);
        return responseData;
      } else {
        print("No data found");
      }
    }catch(e)
    {
      print(":::::::::::EXception in pickup page:::::::update Status:::::::::");
    print(e);}
  }
}