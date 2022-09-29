import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentacar/Screens/Dashboard.dart';
import 'package:rentacar/Screens/services/remote_services.dart';

class BookFormController extends GetxController{
  var currentStep = 0.obs;
  var carid = "".obs;
  final puLocation = TextEditingController();
  final puDate = TextEditingController();
  final puTime = TextEditingController();

  final doLocation = TextEditingController();
  final doDate = TextEditingController();
  final doTime = TextEditingController();

  final emailAddress = TextEditingController();
  final fname = TextEditingController();
  final lname = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();

  RemoteServices rms = RemoteServices();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    puLocation.dispose();
    puDate.dispose();
    puTime.dispose();
    super.onClose();
  }

  String validator(String value) {
    return value.isEmpty ? "Please this field must be filled" : "";
  }

  String emailValidator(String value) {
    String myval = "";
    if (value.isEmpty){
      myval =  "Please this field must be filled";
    }else if(!value.contains("@")){
      myval =  "Please enter a valid email";
    }else if(!value.contains(".com")){
      myval =  "Please enter a valid email";
    }

    return myval;
  }

  void sendData() async{
    print("//////////////////////");
    print("pickup Location : ${puLocation.text}");
    print("pickup Date : ${puDate.text}");
    print("pickup Time : ${puTime.text}");
    print("dropoff Location : ${doLocation.text}");
    print("dropoff Date : ${doDate.text}");
    print("dropoff Time : ${doTime.text}");
    print("email : ${emailAddress.text}");
    print("first : ${fname.text}");
    print("last : ${lname.text}");
    print("phone : ${phone.text}");
    print("address: ${address.text}");
    print("carid: ${carid.value}");
    print("//////////////////////");


    if( puDate.text != null ){

      String res = await rms.uploadForm(carid.value, puLocation.text, puDate.text, puTime.text, doLocation.text,
          doDate.text, doTime.text, emailAddress.text, fname.text, lname.text, phone.text, address.text);

      if (res.isNotEmpty) {
        Get.snackbar('Rent-a-Car', res);
        Get.offAll(Dashboard());
      }

    }else{
      Get.snackbar('Note', 'Please fill all the fields!');
    }
  }

}