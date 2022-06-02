import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_flutter/UI/Food/Add/add_food_model.dart';

class AddFoodRepository {
  Future<AddFoodModel> addFoodApi(
      String accessToken, String name, var price,List<XFile> images, var AQ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accesstoken = prefs.getString('access_token');


    var uri = Uri.parse("https://devhrmapi.mobcoder.com/hrm/api/v1/food/add");
    var request = new http.MultipartRequest(
      "POST",
      uri,
    );


   /* for (var file in images) {
      String fileName = file.path.split("/").last;
      var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
      var length = await file.length(); //imageFile is your image file
      print("File lenght - $length");
      print("fileName - $fileName");
      var multipartFileSign = new http.MultipartFile('images[]', stream, length,
          filename: fileName);
      request.files.add(multipartFileSign);
    }*/


    request.headers["accessToken"] = accesstoken.toString();
    request.headers['Authorization'] = 'Basic aHJtX2FkbWluOmFkbWluQGhybQ==';
    request.fields['name'] = name;
    request.fields['price'] = price as dynamic ;
    request.fields['availableQuantity'] = AQ as dynamic ;

    /////for multiple files-list of images
    for(var file in images){
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'images',
        file.path,
      );
      request.files.add(multipartFile);
      print("${multipartFile.filename.toString()} immagesss");
      print("${multipartFile.filename?.length.toString()} immagesss");
    }

        ///for single file
    /*http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'images',
      images[0].path,
    );
    request.files.add(multipartFile);*/
    //print("${multipartFile.filename.toString()} immagesss");


    var response = await request.send();
    print(response.statusCode);
    final res = await http.Response.fromStream(response);

    if (res.statusCode == 200) {
      print("addFoodModel" + res.statusCode.toString());

      AddFoodModel addFoodModel = AddFoodModel.fromJson(jsonDecode(res.body));

      print("bodyresponse" + addFoodModel.responseData.toString());
      return addFoodModel;
    } else {
      return throw Exception("There is some error");
    }
  }
}
