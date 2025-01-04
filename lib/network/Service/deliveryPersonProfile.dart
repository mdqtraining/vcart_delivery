import 'package:dio/dio.dart';
import 'package:eatfit_delivery_partner/helper/helperClass.dart';
import 'package:eatfit_delivery_partner/network/Url/urlCollection.dart';
import '../../Model/deliveryPersonProfileUpdate/deliveryPersonProfile.dart';

class DeliveyPersonProfileService extends UrlCollection{

  Future deliveyPersonProfile({
    required int deliveryPersonId,
    required String email,
  required String token}) async{

    print("The process was loading");
    Future.delayed(Duration(seconds: 5));
    print(">>>>>>delivery personId----> ${deliveryPersonId}");
    print(">>>>>>delivery GmailId----> ${email}");

    try{
      final dio = Dio();

      FormData formdata = FormData.fromMap({
        "deliveryPersonId": deliveryPersonId,
        "email": email,

      });

      final response = await dio.post(
        UrlCollection.deliveryPersonProfile,
        options: Options(
            headers: {"Accept": "application/json",
            //"App-Key": "$token",
              "x-api-key": Helper.token
        },
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            }),
        data: formdata,
      );

      print("Headers: ${response.requestOptions.headers}");
      print("URL: ${response.requestOptions.uri}");
      print("Data: ${response.requestOptions.data}");

      print("<:::::::::|DeliveryPerson  Api service|::::::::>");
      print(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return deliveryPersonProfile.fromJson(response.data);
      } else {
        print("data was not found");
      }
    }catch(e){
      print("Error catched in delivery person Service");
      print(e);
    }
  }
}
