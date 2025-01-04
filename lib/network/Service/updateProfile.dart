import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:eatfit_delivery_partner/network/Url/urlCollection.dart';
import '../../Model/deliveryPersonProfileUpdate/updateProfileImage.dart';

class UpdateProfileService extends UrlCollection {

  Future updateProfileService({required ProfileImage profileUpdate}) async {
    try {
      final dio = Dio();

      FormData formdata = FormData.fromMap(
          {'deliveryPersonId': profileUpdate.deliveryPersonId,
            "email": profileUpdate.email,
            "profileImage": await MultipartFile.fromFile(profileUpdate.profileImage?.path ?? "")}
      );

      final response = await dio.post(UrlCollection.updateProfile,
        options: Options(
            headers: {
              "Accept": "application/json",
              "x-api-key": "655f636f6d6d657263655f6d6f62696c65"
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            }
        ),
        data: formdata,
      );
      print(
          "::::::::::::::::UpdateImage Api Service:::::::::::::<status code>::::::::::::");
      print(response.statusCode);
      print(response.data);
      //responseJson = response;
      if (response.statusCode == 200 || response.statusCode == 201) {
        //return UpdateImagePhoto.fromJson(response.data);

        final Map<String, dynamic> responseData = jsonDecode(response.data);

        String message = responseData['message'];
        bool error = responseData['error'];

        print(message);
        print(error);
        return responseData;
      } else {
        print("No data found");
      }
    }

    on SocketException {
      print('no internetFound');
    };
  }
}

