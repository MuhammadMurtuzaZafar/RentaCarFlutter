

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rentacar/Screens/models/cars_model.dart';
import 'package:rentacar/Screens/services/remote_services.dart';

class CarsController extends GetxController{
   String cmake = "all";
  var carsList = <Cars>[].obs;
  RemoteServices rms = RemoteServices();


  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

   updateMake(var cm) {
     cmake = cm;
     print('im print ${cmake}');
     fetchCars(cmake);
   }

  void fetchCars(c) async {
    print(c);
    var cars = await rms.fetchCarItems(c);
    if(cars != null){
      carsList.value = cars;
    }
  }

}