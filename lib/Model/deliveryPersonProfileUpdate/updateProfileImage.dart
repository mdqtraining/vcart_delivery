import 'dart:io';

class ProfileImage{

   int? deliveryPersonId;
   String? email;
   File? profileImage;


  ProfileImage({
    required this.deliveryPersonId,
    required this.email ,
    required this.profileImage});
}