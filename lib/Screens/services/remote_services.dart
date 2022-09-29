import 'package:http/http.dart' as http;
import 'package:rentacar/Screens/models/offers_model.dart';

import '../models/cars_model.dart';


class RemoteServices {
  //https://maxilontechnologies.com/rentacar/images/Audi1.png
  var main_url = 'maxilontechnologies.com';

  var client = http.Client();


  Future<List<Offer>> fetchOffers() async{
    var response2 = await client.get(Uri.https(main_url,'/rentacar/offers.php'));
    if(response2.statusCode == 200){
      var jsonString = response2.body;
      print(response2.body);
      return offerFromJson(jsonString);
    }else{
      return [];
    }
  }

   Future<List<Cars>> fetchCarItems(cmake) async {
    var response = await client.post(Uri.https(main_url,'/rentacar/fetch_cars.php'),
        body: {'c_make': cmake});
      if(response.statusCode == 200){
        var jsonString = response.body;
       return carsFromJson(jsonString);
      }else{
        return [];
      }

  }


  Future<String> uploadForm(String car_id, String pick_loc,String pick_date, String pick_time, String drop_loc,
      String drop_date, String drop_time,String email,String fname,String lname,String phone,String address) async {
    var response = await client.post(Uri.https(main_url,'/rentacar/upload_form.php'),
        body: {
              'car_id': car_id,
              'pick_loc': pick_loc,
              'pick_date': pick_date,
              'pick_time': pick_time,
              'drop_loc': drop_loc,
              'drop_date': drop_date,
              'drop_time': drop_time,
              'email': email,
              'fname': fname,
              'lname': lname,
              'phone': phone,
              'address': address,
              });
    if(response.statusCode == 200){
      String result = response.body;
      return Future.value(result);
    }else{
      return Future.value("Something went wrong!");
    }

  }


}