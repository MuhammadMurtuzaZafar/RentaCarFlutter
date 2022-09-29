
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rentacar/Screens/models/offers_model.dart';
import 'package:rentacar/Screens/services/remote_services.dart';

class OffersController extends GetxController{
  var offersList = <Offer>[].obs;
  RemoteServices rms = RemoteServices();

@override
  void onInit() {
    // TODO: implement onInit
  fetchOffers();
  print('Offers print ${offersList.length}');
    super.onInit();
  }


  void fetchOffers() async{
    var offers = await rms.fetchOffers();
    if(offers != null){
      offersList.value = offers;

    }
  }


}