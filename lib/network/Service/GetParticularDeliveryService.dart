import 'package:dio/dio.dart';
import 'package:eatfit_delivery_partner/helper/helperClass.dart';
import 'package:eatfit_delivery_partner/network/Url/urlCollection.dart';
import '../../Model/Orders/Delivery_Model/particulat_item_model.dart';

class GetParticularOrderService extends UrlCollection{

  Future getPartiularIte({required int deliveryPersonId,required int orderId}) async{
    
    final dio = Dio();
    try{
      FormData formData = FormData.fromMap({
        "deliveryPersonId": deliveryPersonId,
        "orderId" : orderId//Helper.orderId
      });
      
      final response = await dio.post(UrlCollection.particularDeliveryItemList,
      options: Options(
        headers: {"Accept":"application/json",
                  "x-api-key": Helper.token},
          followRedirects: false,
          validateStatus: (status){
            return status! <=500;
          }
      ),data: formData);

      if(response.statusCode == 200 || response.statusCode == 201){
        print(":::::::Data fetched SuccessFully::::::::in particular service::::::::");
        print(response.data);
        return ParticularDeliveryItemModel.fromJson(response.data);
      }else{
        print("::::::Error in get ParticularItem in delivery:::::::::");
        print("No response found");
      }
    }catch(exception){
      print(":::::::Exception in getParticularItem in delivery:::::::::");
      print(exception);
    }
  }
}