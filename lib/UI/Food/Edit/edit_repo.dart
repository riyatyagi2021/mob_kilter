import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_flutter/UI/Food/Edit/edit_model.dart';


class EditFoodRepository {

    //List<XFile> imageFile =   Image.asset('assets/images/ic_food_price.png') as List<XFile>;

  Future<EditFoodModel> editFoodApi(
      String accessToken,String foodId, String name, var price,[var AQ=0,List<XFile>? images = const [],]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accesstoken = prefs.getString('access_token');

    final Map<String, dynamic> editData = {

      'foodId': foodId,
      'name': name,
      'price': price as dynamic,
      'AQ': AQ as dynamic,
    };

    if(AQ!=0){
      editData.putIfAbsent(AQ, () => AQ);
    }
    final res = await http.put(
        Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/food/update'),
        body: editData,
        headers: {
          'Authorization': 'Basic aHJtX2FkbWluOmFkbWluQGhybQ==',
          'accessToken': accesstoken.toString(),
        });

    if (res.statusCode == 200) {
      print("editFoodModel" + res.statusCode.toString());

      EditFoodModel editFoodModel = EditFoodModel.fromJson(jsonDecode(res.body));

      print("bodyresponse" + editFoodModel.responseData.toString());
      return editFoodModel;
    } else {
      return throw Exception("There is some error");
    }
  }
}



/////////////This code is without picture update

/*
class EditFoodRepository {
  Future<EditFoodModel> editFoodApi(
      String accessToken,String foodId, String name,var price, [var AQ=0]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accesstoken = prefs.getString('access_token');

  final Map<String, dynamic> editData = {

    'foodId': foodId,
    'name': name,
    'price': price as dynamic,
    'AQ': AQ as dynamic,
  };

  if(AQ!=0){
 editData.putIfAbsent(price, () => AQ);
  }
  final res = await http.put(
  Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/food/update'),
  body: editData,
  headers: {
  'Authorization': 'Basic aHJtX2FkbWluOmFkbWluQGhybQ==',
    'accessToken': accesstoken.toString(),
  });

  if (res.statusCode == 200) {
      print("editFoodModel" + res.statusCode.toString());

      EditFoodModel editFoodModel = EditFoodModel.fromJson(jsonDecode(res.body));

      print("bodyresponse" + editFoodModel.responseData.toString());
      return editFoodModel;
    } else {
      return throw Exception("There is some error");
    }
  }
}
*/
