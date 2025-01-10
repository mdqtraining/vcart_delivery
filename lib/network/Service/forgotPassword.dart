import 'package:dio/dio.dart';
import 'package:eatfit_delivery_partner/network/Url/urlCollection.dart';

import '../../helper/helperClass.dart';

class ForgetPasswordService extends UrlCollection{

  Future forgetPasswordService({required String deilveryBoyMobileNumber,required int newPassword}) async{

    try{
      final dio = Dio();

      FormData formData = FormData.fromMap({
        'deliveryPersonMobile': deilveryBoyMobileNumber,
        'newPassword' : newPassword,
      });

      final response = await dio.post(
              UrlCollection.forgetPassword,
                options: Options(
                  headers: {
                    "Accept":"application/json",
                    "x-api-key": Helper.token},
                  followRedirects: false,
                  validateStatus: (status){
                    return status! <=500;
                  },
                ),
        data: formData,
      );

      if(response.statusCode == 200 || response.statusCode ==201){
        print(":::::::::::Successfully fetched from ForgetPassword::::::::::");
        return response.data;
      }else{
        print("No data found");
      }
    }catch(e){
      print(":::::::::::Exception in ForgetPassword::::::::::");
        print(e);
    }
  }
}