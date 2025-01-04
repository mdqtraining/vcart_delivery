import 'package:dio/dio.dart';
import 'package:eatfit_delivery_partner/helper/helperClass.dart';
import 'package:eatfit_delivery_partner/network/Url/urlCollection.dart';
import '../../Model/Orders/Delivery_Model/particulat_item_model.dart';
import '../../Model/Orders/PickUp_model/pickup_detail_model.dart';

class GetParticularPickupService extends UrlCollection{

  Future getPartiularItem({required int deliveryPersonId}) async{

    final dio = Dio();
    try{
      FormData formData = FormData.fromMap({
        "deliveryPersonId": deliveryPersonId,
        //"orderId" : orderId//Helper.orderId
      });

      final response = await dio.post(UrlCollection.particularPickupDetail,
          options: Options(
              headers: {"Accept":"application/json",
                "x-api-key": Helper.token},
              followRedirects: false,
              validateStatus: (status){
                return status! <=500;
              }
          ),data: formData);

      if(response.statusCode == 200 || response.statusCode == 201){
        print(response.data);
        return GetParticularPickyModel.fromJson(response.data);
      }else{
        print("::::::Error in get ParticularItem in pickupItem:::::::::");
        print("No response found");
      }
    }catch(exception){
      print(":: :: :: ::Exception in getPickupItem:: :: :: :: ::");
      print(exception);
    }
  }
}
