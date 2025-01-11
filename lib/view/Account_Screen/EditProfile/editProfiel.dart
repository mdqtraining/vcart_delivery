import 'dart:io';

import 'package:eatfit_delivery_partner/Model/AccountLogin/loginModel.dart';
import 'package:eatfit_delivery_partner/Model/deliveryPersonProfileUpdate/deliveryPersonProfile.dart';
import 'package:eatfit_delivery_partner/provider/GlobalProvide/LoginChangeNotifierl.dart';
import 'package:eatfit_delivery_partner/util/asset/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import '../../../provider/GlobalProvide/profileNotifier.dart';
import '../../../util/asset/image assest.dart';

class EditProfiele extends StatefulWidget {
  const EditProfiele({super.key});

  @override
  State<EditProfiele> createState() => _EditProfieleState();
}

class _EditProfieleState extends State<EditProfiele> {


  TextEditingController firstName_controller = TextEditingController();
  TextEditingController lastName_controller = TextEditingController();
  TextEditingController primaryMobileNumber_controller = TextEditingController();
  TextEditingController whatsAppMobileNumber_controller = TextEditingController();
  TextEditingController bloodGroup_controller = TextEditingController();
  TextEditingController cityName_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();
  TextEditingController emailId = TextEditingController();

  bool isClicked = false;

  void Clicked(clickAction){
    setState(() {
      isClicked = clickAction;
    });
  }

  @override
  void initState() {
      super.initState();

      WidgetsBinding.instance.addPostFrameCallback((_) async {

        Provider.of<profileNotifier>(context, listen: false).fetchProfileDetailsApi();
        await Provider.of<profileNotifier>(context, listen: false).updateProfile(profileImage: selectImanage!);
        
      final loginProvider = Provider.of<profileNotifier>(context, listen: false);

      if (loginProvider.profileData != null &&
          loginProvider.profileData?.data != null) {
        populateFields(loginProvider.profileData!.data!);
      } else {
        print("waste of time");
      }
    }
    );
  }

  //Uint8List? _image;
  File? selectImanage;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer<profileNotifier>(
        builder: (context,loginProvider,child) {
          if(loginProvider.isLoading){
            CircularProgressIndicator();
          }
          else if (loginProvider.profileData?.data != null) {
              //print("datas are here");
            populateFields(loginProvider.profileData!.data!);
            //return ProfileScreen(data: profileNotifier.profileData!);
          }
          else {
            indicator();
          };
          return Scaffold(
              appBar: AppBar(
                leading: Icon(Icons.arrow_back_ios_new_outlined),
                title: Text("Edit Profile"),
                centerTitle: true,
              ),

              body: loginProvider.profileData?.data != null ?
              ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Center(
                                    child: Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: width * 0.18,
                                          backgroundImage:loginProvider.profileData?.data?.profileImage != null
                                              ? NetworkImage(loginProvider.profileData!.data!.profileImage) as ImageProvider // Use MemoryImage for Uint8List
                                              : AssetImage(staticImages.defalutProfile) as ImageProvider//NetworkImage('https://images.app.goo.gl/weyP1VuhtLGJPMjb7') as ImageProvider,
                                        ),
                                        Positioned(
                                          top: 100,
                                          left: 110,
                                          child: GestureDetector(
                                            onTap: () {
                                              Clicked(true);
                                              showImagePickeroption(context);
                                            },
                                            child: Container(
                                              height: height * 0.04,
                                              width: width * 0.08,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .all(
                                                    Radius.circular(50),),
                                                  color: Colors.grey),
                                              child: Icon(
                                                  Icons.camera_alt_sharp,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                ),

                                SizedBox(height: 16),

                                Text("First Name", style: fontdesign()),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0),
                                  child: textField(firstName_controller,

                                      "nothing great"),
                                ),

                                SizedBox(height: 8),

                                Text("Last Name", style: fontdesign()),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0),
                                  child: textField(lastName_controller, "b"),
                                ),

                                SizedBox(height: 8),

                                // Text("Father Name", style: fontdesign()),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       vertical: 8.0),
                                //   child: textField(fatherName_controller,
                                //       "Please Enter Father Name"),
                                // ),
                                //
                                // SizedBox(height: 8),

                                Text(
                                    "Primary Mobile Number",
                                    style: fontdesign()),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0),
                                  child: textField(
                                      primaryMobileNumber_controller,
                                     " loginProvider.logindata.data.firstName",
                                      inputType: TextInputType.number),
                                ),

                                SizedBox(height: 8),

                                // Text("WhatsApp Number", style: fontdesign()),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       vertical: 8.0),
                                //   child: textField(
                                //       whatsAppMobileNumber_controller,
                                //       "Please Enter WhatsApp Number"),
                                // ),

                                SizedBox(height: 8),

                                Text("Email Id", style: fontdesign()),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0),
                                  child: textField(emailId,
                                      "Please Enter EmailId"),
                                ),

                                SizedBox(height: 8),

                                // Text("Blood Group", style: fontdesign()),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       vertical: 8.0),
                                //   child: textField(bloodGroup_controller,
                                //       "Please Enter Blood Group"),
                                // ),

                                SizedBox(height: 8),

                                Text("City", style: fontdesign()),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0),
                                  child: textField(cityName_controller,
                                      "Please Enter City Name"),
                                ),

                                SizedBox(height: 8),

                                Text("Address", style: fontdesign()),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0),
                                  child: textField(address_controller,
                                      "Please Enter First Name"),
                                ),
                              ],
                            ),
                          )
                      ),
                    ),
                  ]
              ) :Center(child:CircularProgressIndicator())
          );
        }
        );
  }


  //Custom designed textfield for editprofile screen:

    Container textField(TextEditingController controller_name,String hintText,
        {TextInputType inputType = TextInputType.text}){
    return Container(
      height:MediaQuery.of(context).size.height*0.06,
      width: MediaQuery.of(context).size.width,
      child: TextField(
        controller: controller_name,
        textCapitalization: TextCapitalization.words,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          color: Colors.grey,
          //fontFeatures: [FontFeature.]
        ),
        keyboardType: inputType,
        readOnly: true,
        decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),),

          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),

          hintText: hintText,
          hintStyle: GoogleFonts.radioCanada(
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            fontSize: 16
          )
      ),
    ));
  }
  TextStyle fontdesign(){
    return GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }


  void showImagePickeroption(BuildContext context){
    showModalBottomSheet(context: context, builder: (builder){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0,vertical: 24),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.27,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24))
          ),

          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){_pickImageFromGallery();},
                      child: Column(
                        children: [
                          Container(height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                border: Border.all(color: Colors.yellow,width: 4),
                              ),
                              child: Image.asset(staticImages.gallery)
                          ),
                          SizedBox(height: 12),
                          Text("Gallery"),
                        ],
                      ),
                    ),


                    GestureDetector(
                      onTap: (){_pickImageFromCamera();},
                      child: Column(
                        children: [
                          Container(height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                border: Border.all(color: Colors.yellow,width: 2),
                              ),
                              child: Image.asset(staticImages.camera)
                          ),
                          SizedBox(height: 12),
                          Text("Camera"),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 12),

              Material(
                elevation: 4,
                shadowColor: Colors.grey.shade400, // Shadow color
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectImanage = null;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      alignment: Alignment.center,
                      height: 48,
                      width: 180,
                      child: Row(
                        children: [
                          Icon(Icons.cancel_rounded),
                          SizedBox(width: 8),
                          Text("Remove Image")
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  //PickImage From Gallery
  Future _pickImageFromGallery() async{
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    if(returnImage == null) return;

    final pickedFile = File(returnImage.path);
    setState(() {
      selectImanage = File(returnImage.path);
      //_image = File(returnImage.path).readAsBytesSync();
    });

    await Provider.of<profileNotifier>(context, listen: false).updateProfile(profileImage: pickedFile);
    await Provider.of<profileNotifier>(context, listen: false).fetchProfileDetailsApi();

    context.pop();
  }

  Future _pickImageFromCamera() async{
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);

    if(returnImage == null) return;

    final pickedFile = File(returnImage.path);

    setState(() {
      selectImanage = File(returnImage.path);
      //_image = File(returnImage.path).readAsBytesSync();
    });

    await Provider.of<profileNotifier>(context, listen: false).updateProfile(profileImage: pickedFile);
    await Provider.of<profileNotifier>(context, listen: false).fetchProfileDetailsApi();

    context.pop();
  }

  void populateFields(deliveryPersonProfileData data) {

    firstName_controller.text = data.firstName;
    lastName_controller.text = data.lastName;
    primaryMobileNumber_controller.text = data.mobileNumber;
    emailId.text = data.email;
    cityName_controller.text = data.city;
    address_controller.text = data.fullAddress;
  }
}
void indicator(){
  //CircularProgressIndicator();
  print("no value inside, dont try this again");
}
